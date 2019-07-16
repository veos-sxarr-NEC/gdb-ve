/* This testcase is part of GDB, the GNU debugger.

   Copyright 2018 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

// This test is the source for fast-track-debugging.s, before it was put
// through the Cray compiler. As such, it plays no active part in the test
// run but is here for future reference and regeneration.

#include <stdio.h>
#include <math.h>

void do_3 ()
{
    int i = 20000;
    double float_a = 200000;
    while (--i)
	float_a = 1.0 + sqrt(float_a);
    printf("result = %lf\n", float_a);
}

void do_2 ()
{
    int i = 20000;
    double float_a = 200000;
    while (--i)
	float_a = 1.0 + sqrt(float_a);
    do_3();
    printf("result = %lf\n", float_a);
}

void do_1 ()
{
    int i = 20000;
    double float_a = 200000;
    while (--i)
	float_a = 1.0 + sqrt(float_a);
    do_2();
    printf("result = %lf\n", float_a);
}

int main()
{
    void (*func)(void);
    do_1();
    func=&do_3;
    (*func)();
    return 0;
}
