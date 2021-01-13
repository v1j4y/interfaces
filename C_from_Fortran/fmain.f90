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

      module cfunctions_intvec2d
      use, intrinsic :: ISO_C_BINDING
      interface
         subroutine cmapsum2d(vec2d, rows, cols, res) bind(C, name='mapsum2d')
         import C_INT64_T
         integer(kind=C_INT64_T), value :: rows
         integer(kind=C_INT64_T), value :: cols
         integer(kind=C_INT64_T)        :: vec2d(rows,cols)
         integer(kind=C_INT64_T)        :: res
         end subroutine cmapsum2d
      end interface
      end module cfunctions_intvec2d

      program main
      use, intrinsic :: ISO_C_BINDING
      use cfunctions_intvec2d
      implicit none
      integer*8 :: rows = 10
      integer*8 :: cols = 2
      integer*8, dimension(10, 2) :: vec2d
      integer*8 :: res = 0
      integer :: i
      integer :: j
      integer :: count=0
      do i = 1,rows
         do j = 1, cols
            vec2d(i,j) = count
            count = count + 1
            print *,vec2d(i,j)
         end do
      end do
      count = 0
      do i = 1,rows
         do j = 1, cols
            count = count + vec2d(i,j)
         end do
      end do
      print *,rows,cols,res, count
      call cmapsum2d(vec2d, rows, cols, res)
      print *,rows, cols, res
      end program main
