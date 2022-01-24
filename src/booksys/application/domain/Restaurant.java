/*
 * Restaurant Booking System: example code to accompany
 *
 * "Practical Object-oriented Design with UML"
 * Mark Priestley
 * McGraw-Hill (2004)
 */

package booksys.application.domain ;

import booksys.application.persistency.* ;

import java.sql.Date ;
import java.sql.Time ;
import java.util.Vector ;


public class Restaurant
{
  BookingMapper  bm = BookingMapper.getInstance() ;
  CustomerMapper cm = CustomerMapper.getInstance() ;
  TableMapper    tm = TableMapper.getInstance() ;
  MenuMapper	 mm = MenuMapper.getInstance() ;
  
  Vector getBookings(Date date)
  {
    return bm.getBookings(date) ;
  }

  Customer getCustomer(String name, String phone)
  {
    return cm.getCustomer(name, phone) ;
  }
  
  Table getTable(int n)
  {
    return tm.getTable(n) ;
  }

  static Vector getTableNumbers()
  {
    return TableMapper.getInstance().getTableNumbers() ;
  }
  
  //
  Menu getMenu(String mname)
  {
    return mm.getMenu(mname) ; // data o null error
  }

  static Vector getMenuName()
  {
    return MenuMapper.getInstance().getMenuName() ;
  }

  public Booking makeReservation(int covers, Date date,
				     Time time, int tno, String mname , String name, String phone)
  {
    Table t = getTable(tno) ;
    Menu m = getMenu(mname) ; // data o null error
    Customer c = getCustomer(name, phone) ;
    return bm.createReservation(covers, date, time, t, m, c, null) ; // data x null error
  }

  public Booking makeWalkIn(int covers, Date date,
			   Time time, int tno, String mname)
  {
    Table t = getTable(tno) ;
    Menu m = getMenu(mname) ;
    return bm.createWalkIn(covers, date, time, t, m) ;
  }

  public void updateBooking(Booking b)
  {
    bm.updateBooking(b) ;
  }
  
  public void removeBooking(Booking b) {
    bm.deleteBooking(b) ;
  }
  //gui에서 사용하는 예약 수정 부분
  public void editReservation(Booking b , Time editTime, int editCovers) {
//	   bm.editReservation(b, editTime,editCovers);
	 	  
  }
}
