! Arm Forge test case
! Companion source to sw-watchpoint-on-arrays-with-limited-print.exp
program main
    implicit none

    type t_face
      integer :: id_face
      integer :: adj_cell(4)
    end type t_face

    type t_poly
      integer      :: id_poly
      type(t_face) :: face(5)
    end type t_poly

    type t_brick_list
      integer                   :: id_t_brick_list
      type(t_poly), allocatable :: poly(:)
    end type t_brick_list

    integer          :: i, j, k, iface, icell
    integer, target  :: var1, var2, var3
    integer, pointer :: p_var
    type(t_brick_list) :: brick_list(10,10)

    do i=1,10
      do j=1,10
        allocate(brick_list(i,j)%poly(100))
        do k=1,100
          do iface=1,5
            do icell=1,4
              brick_list(i,j)%poly(k)%face(iface)%adj_cell(icell)=1
            end do
          end do
        end do
      end do
    end do
    do i=1,10
      do j=1,10
        do k=1,100
          var1=k
          do iface=1,5
            do icell=1,4 ! change_brick_list
              brick_list(i,j)%poly(k)%face(iface)%adj_cell(icell)=k
            end do
          end do
        end do
      end do
    end do
end program main
