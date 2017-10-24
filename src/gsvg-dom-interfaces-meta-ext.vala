/* gsvg-dom-interfaces-fonts.vala
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

public interface MetadataElement : Object, Element {
}

public interface ForeignObjectElement : Object,
                                    Element,
                                    Tests,
                                    LangSpace,
                                    ExternalResourcesRequired,
                                    Stylable,
                                    Transformable {
  public abstract AnimatedLength x { get; set; }
  public abstract AnimatedLength y { get; set; }
  public abstract AnimatedLength width { get; set; }
  public abstract AnimatedLength height { get; set; }
}

} // GSvg
