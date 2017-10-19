/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-element.vala
 *
 * Copyright (C) 2016, 2017 Daniel Espinosa <esodan@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using GXml;

public class GSvg.GsAnimatedLength : Object,
                                    GomProperty,
                                    AnimatedLength
{
  protected Length _base_val = new GsLength () as Length;
  protected Length _anim_val = new GsLength () as Length;
  protected string _attribute_name = "";
  // GomProperty
  public string attribute_name {
    get { return _attribute_name; }
    construct set { _attribute_name = value; }
  }
  /**
   * Attribute's value in the parent {@link DomElement}.
   */
  public string? value {
    owned get { return _base_val.value_as_string; }
    set {
      if (value != null)
        _base_val.value_as_string = value;
    }
  }
  public bool validate_value (string val) {
    return double.try_parse (val); // FIXME:
  }
  // baseVal
  public Length base_val {
    get { return _base_val; }
    construct set {
      if (value is GsLength)
        _base_val.value_as_string = (value as GsLength).to_string ();
    }
  }
  // animVal
  public Length anim_val {
    get { return _anim_val; }
  }
}

public class GSvg.GsLength : Object, GSvg.Length {
  Length.Type _unit_type = Length.Type.UNKNOWN;
  double _value_in_specified_units = (float) 0.0;
  string _value_as_string = "0";
  public Length.Type unit_type {
    get { return _unit_type; } construct set { _unit_type = value; }
  }
  public double value {
    get {
      return _value_in_specified_units;
    }
    set {
      _value_in_specified_units = value;
      _value_as_string = this.to_string ();
    }
  }
  public double value_in_specified_units {
    get {
      return _value_in_specified_units;
    }
    set {
      _value_in_specified_units = value;
      _value_as_string = this.to_string ();
    }
  }
  public string value_as_string {
    get {
      return _value_as_string;
    }
    set {
    message ("setting: "+value);
      _value_as_string = value;
      parse (_value_as_string);
    }
  }

  public void new_value_specified_units (Length.Type unit_type,
                                        double value_in_specified_units)
                                        throws GLib.Error {
    _unit_type = unit_type;
    this.value_in_specified_units = value_in_specified_units;
    this.value = this.value_in_specified_units;
    value_as_string = this.to_string ();
  }
  public void convert_to_specified_units (Length.Type unit_type) throws GLib.Error {
    GLib.warning ("No implemented");
  }
  public string to_string () {
    try {
      string units = Enumeration.get_string (typeof (Length.Type), _unit_type, true, true);
      if (_unit_type == Length.Type.UNKNOWN
          || _unit_type == Length.Type.NUMBER) units = "";
      if (_unit_type == Length.Type.PERCENTAGE) units = "%";
      string val = "%1.6g".printf (value_in_specified_units);
      return val+units;
    } catch { return ""; }
  }
  public void parse (string? v) {
    if (v == null) return;
    char* rs = null;
    double vd = 0.0;
    double.try_parse (v, out vd);
    _value_in_specified_units = vd;
    _unit_type = Length.Type.UNKNOWN;
    v.to_double (out rs);
    if (rs != null) {
      string rest = (string) rs;
      try {
        var ev = Enumeration.parse (typeof (Length.Type), rest);
        _unit_type = (Length.Type) ev.value;
      } catch { _unit_type = Length.Type.UNKNOWN; }
    }
    if (_value_as_string != v) {
      _value_as_string = this.to_string ();
    }
  }
}

public class GSvg.GsAnimatedLengthX : GSvg.GsAnimatedLength, AnimatedLengthX {
  construct {
    _attribute_name = "x";
  }
}

public class GSvg.GsAnimatedLengthY : GSvg.GsAnimatedLength, AnimatedLengthY {
  construct {
    _attribute_name = "y";
  }
}

public class GSvg.GsAnimatedLengthWidth : GSvg.GsAnimatedLength, AnimatedLengthWidth {
  construct {
    _attribute_name = "width";
  }
}
public class GSvg.GsAnimatedLengthHeight : GSvg.GsAnimatedLength, AnimatedLengthHeight {
  construct {
    _attribute_name = "height";
  }
}

public class GSvg.GsAnimatedLengthRX : GSvg.GsAnimatedLength, AnimatedLengthRX {
  construct {
    _attribute_name = "rx";
  }
}

public class GSvg.GsAnimatedLengthRY : GSvg.GsAnimatedLength, AnimatedLengthRY {
  construct {
    _attribute_name = "ry";
  }
}

public class GSvg.GsAnimatedLengthCX : GSvg.GsAnimatedLength, AnimatedLengthCX {
  construct {
    _attribute_name = "cx";
  }
}

public class GSvg.GsAnimatedLengthCY : GSvg.GsAnimatedLength, AnimatedLengthCY {
  construct {
    _attribute_name = "cy";
  }
}

public class GSvg.GsAnimatedLengthR : GSvg.GsAnimatedLength, AnimatedLengthR {
  construct {
    _attribute_name = "r";
  }
}
