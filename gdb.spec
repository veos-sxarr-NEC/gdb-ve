%global	pname	gdb-ve
%global version	7.11.1
%global release	8.ve

Name: %{pname}
Version: %{version}
Release: %{release}
Summary: The GNU Project Debugger ported to VE

%global pkgdir	%{pname}-%{version}
%global gdb_build build-%{_target_platform}
%global prefix /opt/nec/ve
%global L_infodir share/info
%global infodir %{prefix}/%{L_infodir}
%global L_docdir share/doc/gdb-doc-7.11.1
%global docdir %{prefix}/%{L_docdir}
%global _licensedir %{prefix}/share/doc/%{pkgdir}
%global _sysconfdir /etc/opt/nec/ve

License: GPLv3+ and GPLv3+ with exceptions and GPLv2+ and GPLv2+ with exceptions and GPL+ and LGPLv2+ and LGPLv3+ and BSD and Public Domain and GFDL
Group: Development/Debuggers
Source0: %{pname}-%{version}.tar.gz
Vendor:	NEC Corporation
BuildArch: x86_64
BuildRequires: readline-devel >= 6.2-4
BuildRequires: ncurses-devel texinfo gettext flex bison
BuildRequires: expat-devel
BuildRequires: zlib-devel
BuildRequires: libstdc++
BuildRequires: texinfo-tex
BuildRequires: texlive-collection-latexrecommended
BuildRequires: info
BuildRequires: gzip
BuildRequires: veos-devel
BuildRequires: python-devel
Requires: readline
Requires: zlib
Requires: expat
Requires: veos-libveptrace

%define _unpackaged_files_terminate_build 0

%description
GDB, the GNU Project debugger, allows you to see what is going on 
`inside' another program while it executes -- or what another program 
was doing at the moment it crashed.
This package provides GDB ported to VE

%package doc
Summary: Documentation for GDB (the GNU source-level debugger)
License: GFDL
Group: Documentation
BuildArch: noarch
Requires(post): /sbin/install-info
Requires(preun): /sbin/install-info

%description doc
GDB, the GNU Project debugger, allows you to see what is going on 
`inside' another program while it executes -- or what another program 
was doing at the moment it crashed.

This package provides INFO, HTML and PDF user manual for GDB.

%prep
%setup -q

%build
rm -rf %{buildroot}
mkdir %{gdb_build}
cd %{gdb_build}

../configure 						\
	--prefix=%{prefix} 				\
	--infodir=%{prefix}/share/info 			\
	--target=ve-nec-linux 				\
	--enable-gdb-build-warnings=,-Wno-unused	\
	--disable-nls  					\
	--disable-tui					\
	--program-prefix=""				\
	--with-expat					\
	--with-system-readline				\
	--with-system-zlib				\
	--enable-64-bit-bfd				\
	--disable-sim					\
	--disable-rpath					\
	--sysconfdir=%{_sysconfdir}			\
	--with-system-gdbinit=%{_sysconfdir}/gdbinit

make %{?_smp_mflags} LDFLAGS="$LDFLAGS $FPROFILE_CFLAGS"

make %{?_smp_mflags} \
     -C gdb/doc {gdb,annotate}{.info,/index.html,.pdf} MAKEHTMLFLAGS=--no-split MAKEINFOFLAGS=--no-split

%install
cd %{gdb_build}
rm -rf $RPM_BUILD_ROOT

make %{?_smp_mflags} install DESTDIR=$RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{docdir}
cp gdb/doc/{gdb,annotate}.{html,pdf} $RPM_BUILD_ROOT/%{docdir}
gzip $RPM_BUILD_ROOT/%{infodir}/*.info

mkdir -p $RPM_BUILD_ROOT%{prefix}/share/gdb
mkdir -p $RPM_BUILD_ROOT%{prefix}/share/gdb/auto-load
mkdir -p $RPM_BUILD_ROOT%{prefix}/share/gdb/auto-load/{bin,lib,lib64,sbin}

mkdir -p $RPM_BUILD_ROOT/%{_licensedir}
cp $RPM_BUILD_DIR/%{pkgdir}/gdb/NEWS $RPM_BUILD_ROOT/%{_licensedir}
cp $RPM_BUILD_DIR/%{pkgdir}/gdb/README $RPM_BUILD_ROOT/%{_licensedir}
cp $RPM_BUILD_DIR/%{pkgdir}/COPYING $RPM_BUILD_ROOT/%{_licensedir}
cp $RPM_BUILD_DIR/%{pkgdir}/COPYING.LIB $RPM_BUILD_ROOT/%{_licensedir}
cp $RPM_BUILD_DIR/%{pkgdir}/COPYING3 $RPM_BUILD_ROOT/%{_licensedir}

mkdir -p $RPM_BUILD_ROOT%{prefix}/share/gdb/python/gdb
cp $RPM_BUILD_DIR/%{pkgdir}/gdb/python/lib/gdb/*.py $RPM_BUILD_ROOT%{prefix}/share/gdb/python/gdb
mkdir -p $RPM_BUILD_ROOT%{prefix}/share/gdb/python/gdb/command
cp $RPM_BUILD_DIR/%{pkgdir}/gdb/python/lib/gdb/command/*.py $RPM_BUILD_ROOT%{prefix}/share/gdb/python/gdb/command
mkdir -p $RPM_BUILD_ROOT%{prefix}/share/gdb/python/gdb/function
cp $RPM_BUILD_DIR/%{pkgdir}/gdb/python/lib/gdb/function/*.py $RPM_BUILD_ROOT%{prefix}/share/gdb/python/gdb/function

gzip $RPM_BUILD_ROOT%{prefix}/share/man/*/{gdb.1,gdbinit.5}

%clean
rm -fr $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{_licensedir}/COPYING3
%{_licensedir}/COPYING
%{_licensedir}/COPYING.LIB
%{_licensedir}/README
%{_licensedir}/NEWS
%{prefix}/bin/gdb
%dir %{prefix}/share/gdb
%dir %{prefix}/share/gdb/auto-load
%dir %{prefix}/share/gdb/auto-load/bin
%dir %{prefix}/share/gdb/auto-load/lib
%dir %{prefix}/share/gdb/auto-load/lib64
%dir %{prefix}/share/gdb/auto-load/sbin
%dir %{prefix}/share/gdb/syscalls
%{prefix}/share/gdb/syscalls/amd64-linux.xml
%{prefix}/share/gdb/syscalls/gdb-syscalls.dtd
%{prefix}/share/gdb/syscalls/i386-linux.xml
%{prefix}/share/gdb/syscalls/ve-linux.xml
%dir %{prefix}/share/gdb/python
%dir %{prefix}/share/gdb/python/gdb
%dir %{prefix}/share/gdb/python/gdb/command
%dir %{prefix}/share/gdb/python/gdb/function
%{prefix}/share/gdb/python/gdb/*.py
%{prefix}/share/gdb/python/gdb/*.pyc
%{prefix}/share/gdb/python/gdb/*.pyo
%{prefix}/share/gdb/python/gdb/command/*
%{prefix}/share/gdb/python/gdb/function/*
%{prefix}/share/gdb/python/gdb/printer/*
%{prefix}/share/man/man1/gdb.1.gz
%{prefix}/share/man/man5/gdbinit.5.gz

%files doc
%doc %{docdir}/gdb.pdf
%doc %{docdir}/gdb.html
%doc %{docdir}/annotate.pdf
%doc %{docdir}/annotate.html
%defattr(-,root,root)
%{infodir}/annotate.info*
%{infodir}/gdb.info*

%post doc
# This step is part of the installation of the RPM. Not to be confused
# with the 'make install ' of the build (rpmbuild) process.

# For --excludedocs:
if [ -e %{infodir}/gdb.info.gz ]
then
  /sbin/install-info --info-dir=%{infodir} %{infodir}/annotate.info.gz || :
  /sbin/install-info --info-dir=%{infodir} %{infodir}/gdb.info.gz || :
fi

%preun doc
if [ $1 = 0 ]
then
  # For --excludedocs:
  if [ -e %{infodir}/gdb.info.gz ]
  then
    /sbin/install-info --delete --info-dir=%{infodir} %{infodir}/annotate.info.gz || :
    /sbin/install-info --delete --info-dir=%{infodir} %{infodir}/gdb.info.gz || :
  fi
fi
