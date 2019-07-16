     program string_1
         implicit none
         !declaration
         character(len=6) :: word1
         character(len=2) :: word2
         character, allocatable :: word3(:)
         !assignment
         word1 = "abcdef"
         !substring
         word2 = word1(5:6)
         !escape with a double quote
         word1 = 'Don''t '
         allocate(word3(8))
         word3="hehehehe"
         !Concatenation
         write(*,*) word2//word1
         write(*,*) word3(1:2)
         call p_string(word1, word3)
     end program string_1

     subroutine p_string(word1, word3)
         character(len=6) :: word1
         character(len=538976288):: word3
         write(*,*) word3 !break here
     end subroutine
