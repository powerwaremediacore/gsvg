/* gsvg-dom-interfaces-basic-shapes.vala
 *
 * Copyright (C) 2016 Daniel Espinosa <daniel.espinosa@pwmc.mx>
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

public interface EllipseElement : Object,
                              Element,
                              Tests,
                              LangSpace,
                              ExternalResourcesRequired,
                              Stylable,
                              Transformable {
  public abstract AnimatedLengthCX cx { get; construct set; }
  public abstract AnimatedLengthCY cy { get; construct set; }
  public abstract AnimatedLengthRX rx { get; construct set; }
  public abstract AnimatedLengthRY ry { get; construct set; }
}

public interface LineElement : Object,
                           Element,
                           Tests,
                           LangSpace,
                           ExternalResourcesRequired,
                           Stylable,
                           Transformable {
  public abstract AnimatedLength x1 { get; }
  public abstract AnimatedLength y1 { get; }
  public abstract AnimatedLength x2 { get; }
  public abstract AnimatedLength y2 { get; }
}

public interface AnimatedPoints : Object {
  public abstract PointList points { get; }
  public abstract PointList animatedPoints { get; }
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
