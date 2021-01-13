      module cfunctions
      use, intrinsic :: ISO_C_BINDING
      interface
         subroutine cbinom(n, k, res) bind(C, name='binom')
         import C_FLOAT
         real(kind=C_FLOAT) :: n
         real(kind=C_FLOAT) :: k
         real(kind=C_FLOAT) :: res
         end subroutine cbinom
      end interface
      end module cfunctions

      module cfunctions_intvec1d
      use, intrinsic :: ISO_C_BINDING
      interface
         subroutine cmapsum(vec, len, res) bind(C, name='mapsum')
         import C_INT64_T
         integer(kind=C_INT64_T) :: len
         integer(kind=C_INT64_T) :: vec(len)
         integer(kind=C_INT64_T) :: res
         end subroutine cmapsum
      end interface
      end module cfunctions_intvec1d

      program main
      use, intrinsic :: ISO_C_BINDING
      use cfunctions_intvec1d
      implicit none
      integer*8 :: len = 10
      integer*8, dimension(10) :: vec
      integer*8 :: res = 0
      integer :: i
      print *,len,res
      do i = 1,len
         vec(i) = i
         print *,vec(i)
      end do
      call cmapsum(vec, len, res)
      print *,len,res
      end program main
