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

public class GSvg.GsRect : GSvg.Element {
  protected AnimatedLength _x;
  protected AnimatedLength _y;
  protected AnimatedLength _width;
  protected AnimatedLength _height;
  protected AnimatedLength _rx;
  protected AnimatedLength _ry
  // RectElement
  [Description (nick="::id")]
  public AnimatedLength x {
    get { return _x; } construct set { _x = value; }
  }
  [Description (nick="::id")]
  public AnimatedLength y {
    get { return _y; } construct set { _y = value; }
  }
  [Description (nick="::id")]
  public AnimatedLength width {
    get { return _width; } construct set { _width = value; }
  }
  [Description (nick="::id")]
  public AnimatedLength height{
    get { return _height; } construct set { _height = value; }
  }
  [Description (nick="::id")]
  public AnimatedLength rx {
    get { return _rx; } construct set { _rx = value; }
  }
  [Description (nick="::id")]
  public AnimatedLength ry {
    get { return _ry; } construct set { _ry = value; }
  }
  construct {
    _local_name = "rect";
  }
  public Rect.initialize (GSvg.Svg parent, AnimatedLength x, AnimatedLength y,
                          AnimatedLength width, AnimatedLength height) {
    _document = parent.owner_document;
    _x = x;
    _y = y;
    _width = width;
    _height = height;
    parent.append_child (this);
  }
}
