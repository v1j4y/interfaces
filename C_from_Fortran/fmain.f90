      module cfunctions_intvec4d
      use, intrinsic :: ISO_C_BINDING
      interface
         subroutine cmapsum4d(vec2d, rows, cols, res) bind(C, name='mapsum4d')
         import C_INT64_T, C_DOUBLE
         integer(kind=C_INT64_T), value :: rows
         integer(kind=C_INT64_T), value :: cols
         real(kind=C_DOUBLE)        :: vec2d(rows,cols)
         real(kind=C_DOUBLE)        :: res
         end subroutine cmapsum4d
      end interface
      end module cfunctions_intvec4d

      program main
      use, intrinsic :: ISO_C_BINDING
      use cfunctions_intvec4d
      implicit none
      integer*8 :: rows = 10
      integer*8 :: cols = 2
      real*8, dimension(2,2,10, 2) :: vec2d
      real*8 :: res = 0
      integer :: i
      integer :: j,k,l
      integer :: count=0
      do k=1,2
         do l=1,2
            count = 0
            do i = 1,rows
               do j = 1, cols
                  vec2d(k,l,i,j) = count*1.0
                  count = count + 1
                  print *,vec2d(k,l,i,j)
               end do
            end do
         end do
      end do
      count = 0
      do i = 1,rows
         do j = 1, cols
            count = count + vec2d(1,1,i,j)
         end do
      end do
      print *,rows,cols,res, count
      call cmapsum4d(vec2d(1,1,:,:), rows, cols, res)
      call cmapsum4d(vec2d(1,2,:,:), rows, cols, res)
      call cmapsum4d(vec2d(2,1,:,:), rows, cols, res)
      call cmapsum4d(vec2d(2,2,:,:), rows, cols, res)
      print *,rows, cols, res
      end program main

      module cfunctions_intvec4d
      use, intrinsic :: ISO_C_BINDING
      interface
         subroutine cmapsum4d(vec2d, rows, cols, res) bind(C, name='mapsum4d')
         import C_INT64_T, C_DOUBLE
         integer(kind=C_INT64_T), value :: rows
         integer(kind=C_INT64_T), value :: cols
         real(kind=C_DOUBLE)        :: vec2d(rows,cols)
         real(kind=C_DOUBLE)        :: res
         end subroutine cmapsum4d
      end interface
      end module cfunctions_intvec4d

      program main
      use, intrinsic :: ISO_C_BINDING
      use cfunctions_intvec4d
      implicit none
      integer*8 :: rows = 10
      integer*8 :: cols = 2
      real*8, dimension(2,2,10, 2) :: vec2d
      real*8 :: res = 0
      integer :: i
      integer :: j,k,l
      integer :: count=0
      do k=1,2
         do l=1,2
            count = 0
            do i = 1,rows
               do j = 1, cols
                  vec2d(k,l,i,j) = count*1.0
                  count = count + 1
                  print *,vec2d(k,l,i,j)
               end do
            end do
         end do
      end do
      count = 0
      do i = 1,rows
         do j = 1, cols
            count = count + vec2d(1,1,i,j)
         end do
      end do
      print *,rows,cols,res, count
      call cmapsum4d(vec2d(1,1,:,:), rows, cols, res)
      call cmapsum4d(vec2d(1,2,:,:), rows, cols, res)
      call cmapsum4d(vec2d(2,1,:,:), rows, cols, res)
      call cmapsum4d(vec2d(2,2,:,:), rows, cols, res)
      print *,rows, cols, res
      end program main
