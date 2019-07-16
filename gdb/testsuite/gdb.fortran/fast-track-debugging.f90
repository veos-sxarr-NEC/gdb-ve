! Copyright 2018 Free Software Foundation, Inc.

! This program is free software; you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation; either version 3 of the License, or
! (at your option) any later version.
!
! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.
!
! You should have received a copy of the GNU General Public License
! along with this program.  If not, see <http://www.gnu.org/licenses/>.

recursive subroutine recursive_subroutine(x, n)
integer,intent(inout):: x
integer,intent(in):: n
if (x < n) then
  x = x + 1
  call recursive_subroutine(x, n)
end if
end subroutine recursive_subroutine

subroutine logistic_map()
integer:: i = 0
real:: a = 3.6
real:: x = 0.5
do i = 0, 200000
  x = a*x*(1 - x)
enddo
end subroutine logistic_map

program main
integer:: x = 0
integer:: n = 5
call logistic_map()
call recursive_subroutine(x, n)
end program main
