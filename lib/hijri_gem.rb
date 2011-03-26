class Time
  def to_hijri
    return Hijri.convert_time(self)
  end
end

class Hijri
  attr_accessor :epoch, :second, :minute, :hour, :day, :month, :year, :offset
  
  # TODO: names
  
  h_days = ['Ahad', 'Ithnain', 'Thulatha', 'Arbiaa', 'Khamees', 'Jumaa', 'Sabt']
  h_days_abbr = ['Ahd', 'Ith', 'Tha', 'Arb', 'Kha', 'Jum', 'Sab']
  h_months = [nil,
		     'Muharram', 'Safar', 'Rabi I', 'Rabi II',
		     'Jumada I', 'Jumada II', 'Rajab', 'Shaaban',
		     'Ramadan', 'Shawwal', 'Thul-Qiaadah', 'Thul-Hijja']
  h_months_abbr = [nil,
			   'Muh', 'Saf', 'Rb1', 'Rb2',
			   'Jm1', 'Jm2', 'Raj', 'Sha',
			   'Ram', 'Sha', 'Qid', 'Hij']
			   
  def to_s
    off = self.offset / (60*60).to_f
    str = "-04:00"
    str = "#{off > 0 ? '+' : '-'}#{off.to_i.abs.to_s.rjust(2,'0')}:#{((off-off.to_i)*60*10).to_i.to_s.rjust(2,'0')}"
    "#{year}-#{month.to_s.rjust(2,'0')}-#{day.to_s.rjust(2,'0')} #{hour.to_s.rjust(2,'0')}:#{minute.to_s.rjust(2,'0')}:#{second.to_s.rjust(2,'0')} #{str}"
  end
			   
  def self.convert_time(time)
    h = self.new
    
    # following is converted from PHP via http://www.phpclasses.org/browse/download/1/file/2358/name/ICalendar.php
    # which is converted from C++ via http://arabeyes.org
    if(( time.year > 1582 ) || (( time.year == 1582 ) && ( time.month > 10 )) || (( time.year == 1582 ) && ( time.month == 10 ) && ( time.day > 14 ))) 
      jd = (( 1461 * ( time.year + 4800 + (( time.month - 14 ) / 12 )))/ 4).floor + (( 367 * ( time.month - 2 - 12 * ((( time.month - 14 ) / 12).floor))) / 12).floor - (( 3 * ((( time.year + 4900+ (( time.month - 14) / 12).floor ) / 100).floor)) / 4).floor + time.day - 32075;
    else
      jd = 367 * time.year - (( 7 * ( time.year + 5001 + (( time.month - 9 ) / 7).floor)) / 4).floor + (( 275 * time.month) / 9).floor + time.day + 1729777;
    end
  	
  	l = jd - 1948440 + 10632;
  	n = (( l - 1 ) / 10631).floor;
  	l = l - 10631 * n + 354;
  	j = ((( 10985 - l ) / 5316).floor) * ((( 50 * l) / 17719).floor) + (( l / 5670 ).floor) * ( (( 43 * l ) / 15238 ).floor);
  	l = l - ( (( 30 - j ) / 15 ).floor) * ( (( 17719 * j ) / 50).floor) - ( ( j / 16 ).floor) * ( (( 15238 * j ) / 43 ).floor) + 29;
  	
  	h.month = (( 24 * l ) / 709 ).floor;
  	h.day   = l - (( 709 * h.month ) / 24).floor;
  	h.year  = 30 * n + j - 30;
  	
  	h.hour   = time.hour
  	h.minute = time.min
  	h.second = time.sec
  	h.offset = time.utc_offset

	  return h
  end
end
