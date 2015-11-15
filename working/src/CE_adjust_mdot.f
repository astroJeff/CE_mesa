! ***********************************************************************
!
!   Copyright (C) 2012  Bill Paxton
!
!   MESA is free software; you can use it and/or modify
!   it under the combined terms and restrictions of the MESA MANIFESTO
!   and the GNU General Library Public License as published
!   by the Free Software Foundation; either version 2 of the License,
!   or (at your option) any later version.
!
!   You should have received a copy of the MESA MANIFESTO along with
!   this software; if not, it is available at the mesa website:
!   http://mesa.sourceforge.net/
!
!   MESA is distributed in the hope that it will be useful,
!   but WITHOUT ANY WARRANTY; without even the implied warranty of
!   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
!   See the GNU Library General Public License for more details.
!
!   You should have received a copy of the GNU Library General Public License
!   along with this software; if not, write to the Free Software
!   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
!
! ***********************************************************************

      module CE_adjust_mdot

      use star_def
      use const_def

      implicit none


      contains

      ! set use_other_adjust_mdot = .true. to enable this.
      ! your routine will be called after winds and before mass adjustment

      subroutine CE_other_adjust_mdot(id, ierr)

         integer, intent(in) :: id
         integer, intent(out) :: ierr
         type (star_info), pointer :: s
         integer :: k
         real(dp) :: mass_to_remove

         ierr = 0
         call star_ptr(id, s, ierr)
         if (ierr /= 0) return


         s% mstar_dot = s% mstar_dot - s% xtra7 !In gr/s
         write(*,*) "********", s% xtra7, s% mstar_dot, s% xtra7_old


      end subroutine CE_other_adjust_mdot




      end module CE_adjust_mdot
