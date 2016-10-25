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
  public abstract AnimatedLength x { get; }
  public abstract AnimatedLength y { get; }
  public abstract AnimatedLength width { get; }
  public abstract AnimatedLength height { get; }
  public abstract AnimatedLength rx { get; }
  public abstract AnimatedLength ry { get; }
}

public interface CircleElement : Object,
                             Element,
                             Tests,
                             LangSpace,
                             ExternalResourcesRequired,
                             Stylable,
                             Transformable {
  public abstract AnimatedLength cx { get; }
  public abstract AnimatedLength cy { get; }
  public abstract AnimatedLength r { get; }
}

public interface EllipseElement : Object,
                              Element,
                              Tests,
                              LangSpace,
                              ExternalResourcesRequired,
                              Stylable,
                              Transformable {
  public abstract AnimatedLength cx { get; }
  public abstract AnimatedLength cy { get; }
  public abstract AnimatedLength rx { get; }
  public abstract AnimatedLength ry { get; }
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
