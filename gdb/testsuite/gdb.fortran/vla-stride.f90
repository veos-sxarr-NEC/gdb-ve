! Copyright 2014 Free Software Foundation, Inc.
!
! This program is free software; you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation; either version 2 of the License, or
! (at your option) any later version.
!
! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.
!
! You should have received a copy of the GNU General Public License
! along with this program; if not, write to the Free Software
! Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

program vla_stride
  integer, target, allocatable :: vla (:)
  integer, pointer :: pvla (:)

  allocate(vla(10))
  vla = (/ (I, I = 1,10) /)

  pvla => vla(10:1:-1)
  pvla => pvla(10:1:-1)
  pvla => vla(1:10:2)   ! re-reverse-elements
  pvla => vla(5:4:-2)   ! odd-elements

  pvla => null()        ! single-element
end program vla_stride
