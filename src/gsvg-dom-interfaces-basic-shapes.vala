/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-interfaces-basic-shapes.vala
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

namespace GSvg {

public interface RectElement : Object,
                           Element,
                           Tests,
                           LangSpace,
                           ExternalResourcesRequired,
                           Stylable,
                           Transformable {
  public abstract AnimatedLengthX x { get; set; }
  public abstract AnimatedLengthY y { get; set; }
  public abstract AnimatedLengthWidth width { get; set; }
  public abstract AnimatedLengthHeight height { get; set; }
  public abstract AnimatedLengthRX rx { get; set; }
  public abstract AnimatedLengthRY ry { get; set; }
}

public interface RectElementMap : Object {
  public abstract int length { get; }
  public abstract RectElement get (string id);
}

public interface CircleElement : Object,
                             Element,
                             Tests,
                             LangSpace,
                             ExternalResourcesRequired,
                             Stylable,
                             Transformable {
  public abstract AnimatedLengthCX cx { get; set; }
  public abstract AnimatedLengthCY cy { get; set; }
  public abstract AnimatedLengthR  r { get; set; }
}

public interface CircleElementMap : Object {
  public abstract int length { get; }
  public abstract CircleElement get (string id);
}

public interface EllipseElement : Object,
                              Element,
                              Tests,
                              LangSpace,
                              ExternalResourcesRequired,
                              Stylable,
                              Transformable {
  public abstract AnimatedLengthCX cx { get; set; }
  public abstract AnimatedLengthCY cy { get; set; }
  public abstract AnimatedLengthRX rx { get; set; }
  public abstract AnimatedLengthRY ry { get; set; }
}

public interface EllipseElementMap : Object {
  public abstract int length { get; }
  public abstract EllipseElement get (string id);
}

public interface LineElement : Object,
                           Element,
                           Tests,
                           LangSpace,
                           ExternalResourcesRequired,
                           Stylable,
                           Transformable {
  public abstract AnimatedLengthX x1 { get; set; }
  public abstract AnimatedLengthY y1 { get; set; }
  public abstract AnimatedLengthX x2 { get; set; }
  public abstract AnimatedLengthY y2 { get; set; }
}

public interface AnimatedPoints : Object {
  public abstract PointList points { get; }
  public abstract PointList animated_points { get; }
}

public interface PolylineElement : Object,
                               Element,
                               Tests,
                               LangSpace,
                               ExternalResourcesRequired,
                               Stylable,
                               Transformable,
                               AnimatedPoints {
}

public interface PolygonElement : Object,
                              Element,
                              Tests,
                              LangSpace,
                              ExternalResourcesRequired,
                              Stylable,
                              Transformable,
                              AnimatedPoints {
}

} // GSvg
