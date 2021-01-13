      module cfunctions
!     use ISO_C_BINDING, only : C_CHAR, C_INT, C_FLOAT, C_PTR
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

      program main
!     use ISO_C_BINDING, only : C_PTR, C_FLOAT, C_F_POINTER
      use, intrinsic :: ISO_C_BINDING
      use cfunctions
      implicit none
      real :: n   = 4.0d0
      real :: k   = 2.0d0
      real :: res =-1.0d0
      print *,n,k,res
      call cbinom(n, k, res)
      print *,n,k,res
      end program main
