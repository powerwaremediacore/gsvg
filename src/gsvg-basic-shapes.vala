/* gsvg-dom-element.vala
 *
 * Copyright (C) 2016 Daniel Espinosa
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

public class GSvg.GsTransformable : GSvg.GsCommonElement,
                                  Transformable
{
  protected AnimatedTransformList _transform;
  // Transformable
  public AnimatedTransformList transform { get { return _transform; } }
}

public class GSvg.GsRectElement : GSvg.GsTransformable,
                          GSvg.RectElement
{
  protected AnimatedLengthX _x;
  protected AnimatedLengthY _y;
  protected AnimatedLengthWidth _width;
  protected AnimatedLengthHeight _height;
  protected AnimatedLengthRX _rx;
  protected AnimatedLengthRY _ry;
  // RectElement
  public AnimatedLengthX x {
    get { return _x; } construct set { _x = value; }
  }
  public AnimatedLengthY y {
    get { return _y; } construct set { _y = value; }
  }
  public AnimatedLengthWidth width {
    get { return _width; } construct set { _width = value; }
  }
  public AnimatedLengthHeight height{
    get { return _height; } construct set { _height = value; }
  }
  public AnimatedLengthRX rx {
    get { return _rx; } construct set { _rx = value; }
  }
  public AnimatedLengthRY ry {
    get { return _ry; } construct set { _ry = value; }
  }
  construct {
    _local_name = "rect";
  }
  public GsRectElement.initialize (GSvg.GsSvg parent,
                          string? x,
                          string? y,
                          string? width,
                          string? height,
                          string? rx,
                          string? ry) {
    _document = parent.owner_document;
    if (x != null) {
        _x = new GsAnimatedLengthX () as AnimatedLengthX;
        (_x.base_val as GsLength).parse (x);
        GLib.message ("X: "+_x.base_val.value_as_string);
        GLib.message ("X is Property: "+(_x is GomProperty).to_string ());
    }
    if (y != null) {
      _y = new GsAnimatedLengthY () as AnimatedLengthY;
      (_y.base_val as GsLength).parse (y);
    }
    if (width != null) {
      _width = new GsAnimatedLengthWidth () as AnimatedLengthWidth;
      (_width.base_val as GsLength).parse (width);
    }
    if (height != null) {
      _height = new GsAnimatedLengthHeight () as AnimatedLengthHeight;
      (_height.base_val as GsLength).parse (height);
     }
    if (rx != null) {
      _rx = new GsAnimatedLengthRX () as AnimatedLengthRX;
      (_rx.base_val as GsLength).parse (rx);
     }
    if (ry != null) {
      _ry = new GsAnimatedLengthRY () as AnimatedLengthRY;
      (_ry.base_val as GsLength).parse (ry);
    }
  }
}

public class GSvg.GsCircleElement : GSvg.GsTransformable,
                          GSvg.CircleElement
{
  protected AnimatedLengthCX _cx;
  protected AnimatedLengthCY _cy;
  protected AnimatedLengthR _r;
  // RectElement
  public AnimatedLengthCX cx {
    get { return _cx; } construct set { _cx = value; }
  }
  public AnimatedLengthCY cy {
    get { return _cy; } construct set { _cy = value; }
  }
  public AnimatedLengthR r {
    get { return _r; } construct set { _r = value; }
  }
  construct {
    _local_name = "circle";
  }
  public GsCircleElement.initialize (GSvg.GsSvg parent,
                          string? cx,
                          string? cy,
                          string? r) {
    _document = parent.owner_document;
    if (cx != null) {
        _cx = new GsAnimatedLengthCX () as AnimatedLengthCX;
        (_cx.base_val as GsLength).parse (cx);
    }
    if (cy != null) {
      _cy = new GsAnimatedLengthCY () as AnimatedLengthCY;
      (_cy.base_val as GsLength).parse (cy);
    }
    if (r != null) {
      _r = new GsAnimatedLengthR () as AnimatedLengthR;
      (_r.base_val as GsLength).parse (r);
    }
  }
}

public class GSvg.GsEllipseElement : GSvg.GsTransformable,
                          GSvg.EllipseElement
{
  protected AnimatedLengthCX _cx;
  protected AnimatedLengthCY _cy;
  protected AnimatedLengthRX _rx;
  protected AnimatedLengthRY _ry;
  // RectElement
  public AnimatedLengthCX cx {
    get { return _cx; } construct set { _cx = value; }
  }
  public AnimatedLengthCY cy {
    get { return _cy; } construct set { _cy = value; }
  }
  public AnimatedLengthRX rx {
    get { return _rx; } construct set { _rx = value; }
  }
  public AnimatedLengthRY ry {
    get { return _ry; } construct set { _ry = value; }
  }
  construct {
    _local_name = "ellipse";
  }
  public GsEllipseElement.initialize (GSvg.GsSvg parent,
                          string? cx,
                          string? cy,
                          string? rx,
                          string? ry) {
    _document = parent.owner_document;
    if (cx != null) {
        _cx = new GsAnimatedLengthCX () as AnimatedLengthCX;
        (_cx.base_val as GsLength).parse (cx);
    }
    if (cy != null) {
      _cy = new GsAnimatedLengthCY () as AnimatedLengthCY;
      (_cy.base_val as GsLength).parse (cy);
    }
    if (rx != null) {
      _rx = new GsAnimatedLengthRX () as AnimatedLengthRX;
      (_rx.base_val as GsLength).parse (rx);
     }
    if (ry != null) {
      _ry = new GsAnimatedLengthRY () as AnimatedLengthRY;
      (_ry.base_val as GsLength).parse (ry);
    }
  }
}
