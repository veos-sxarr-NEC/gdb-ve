# Program to fetch python compilation parameters.
# Copied from python-config of the 2.7 release.

import sys
import os
import getopt

# distutils.sysconfig's get_python_inc(), PREFIX, and EXEC_PREFIX have been deprecated in Python 3.10.
if sys.version_info >= (3, 10):
    import sysconfig
    def get_prefix():
        return sysconfig.get_config_var("prefix")
    def get_exec_prefix():
        return sysconfig.get_config_var("exec_prefix")
    def get_python_inc(plat_specific=False):
        if plat_specific:
            return sysconfig.get_path('platinclude')
        else:
            return sysconfig.get_path('include')
else:
    from distutils import sysconfig
    get_prefix = lambda: sysconfig.PREFIX
    get_exec_prefix = lambda: sysconfig.EXEC_PREFIX
    get_python_inc = sysconfig.get_python_inc

valid_opts = ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
              'ldflags', 'help']

def exit_with_usage(code=1):
    sys.stderr.write ("Usage: %s [%s]\n" % (sys.argv[0],
                                          '|'.join('--'+opt for opt in valid_opts)))
    sys.exit(code)

try:
    opts, args = getopt.getopt(sys.argv[1:], '', valid_opts)
except getopt.error:
    exit_with_usage()

if not opts:
    exit_with_usage()

pyver = sysconfig.get_config_var('VERSION')
getvar = sysconfig.get_config_var
abiflags = getattr (sys, "abiflags", "")

opt_flags = [flag for (flag, val) in opts]

if '--help' in opt_flags:
    exit_with_usage(code=0)

def to_unix_path(path):
    """On Windows, returns the given path with all backslashes
    converted into forward slashes.  This is to help prevent problems
    when using the paths returned by this script with cygwin tools.
    In particular, cygwin bash treats backslashes as a special character.

    On Unix systems, returns the path unchanged.
    """
    if os.name == 'nt':
        path = path.replace('\\', '/')
    return path

for opt in opt_flags:
    if opt == '--prefix':
        print (to_unix_path(get_prefix()))

    elif opt == '--exec-prefix':
        print (to_unix_path(get_exec_prefix()))

    elif opt in ('--includes', '--cflags'):
        flags = ['-I' + get_python_inc(),
                 '-I' + get_python_inc(plat_specific=True)]
        if opt == '--cflags':
            flags.extend(getvar('CFLAGS').split())
        print (to_unix_path(' '.join(flags)))

    elif opt in ('--libs', '--ldflags'):
        libs = ['-L' + getvar('LIBDIR')]
        libs.append('-lpython'+pyver + abiflags)
        if getvar('LIBS') is not None:
            libs.extend(getvar('LIBS').split())
        if getvar('SYSLIBS') is not None:
            libs.extend(getvar('SYSLIBS').split())
        # add the prefix/lib/pythonX.Y/config dir, but only if there is no
        # shared library in prefix/lib/.
        if opt == '--ldflags':
            if not getvar('Py_ENABLE_SHARED'):
                if getvar('LIBPL') is not None:
                    libs.insert(0, '-L' + getvar('LIBPL'))
                elif os.name == 'nt':
                    libs.insert(0, '-L' + sysconfig.PREFIX + '/libs')
        print (to_unix_path(' '.join(libs)))

