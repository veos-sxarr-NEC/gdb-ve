program main

    real(kind=8), allocatable :: arr_in(:)
    allocate (arr_in(10)) ! Breakpoint allocate

    ! This prevents the program being optimized completely away
    print *,"break here"

    deallocate(arr_in) ! Breakpoint deallocate

end program main
