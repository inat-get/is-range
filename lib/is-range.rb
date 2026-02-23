# frozen_string_literal: true

class Range

  def & other
    return nil unless overlap?(other)
    b, e, x = self.begin, self.end, self.exclude_end?
    bb, ee, xx = other.begin, other.end, other.exclude_end?
    rb = if !bb || (b && b > bb)
        b
      else
        bb
      end
    re, rx = if !ee || (e && e < ee)
      [e, x]
    else
      [ee, xx]
    end
    Range::new rb, re, rx
  end

  def | other
    return nil unless overlap?(other) || self.end_succ == other.begin || self.begin == other.end_succ
    b, e, x = self.begin, self.end, self.exclude_end?
    bb, ee, xx = other.begin, other.end, other.exclude_end?
    rb = if !b || (bb && b < bb)
      b
    else
      bb
    end
    re, rx = if !e || (ee && e > ee)
      [e, x]
    elsif e == ee
      [e, x && xx]
    else
      [ee, xx]
    end
    Range::new rb, re, rx
  end

  def empty?
    return false if self.begin.nil? || self.end.nil?
    self.begin > self.end || (self.exclude_end? && self.begin == self.end)
  end

  protected def end_succ
    return self.end if exclude_end? || !self.end.respond_to?(:succ)
    self.end.succ
  end

end
