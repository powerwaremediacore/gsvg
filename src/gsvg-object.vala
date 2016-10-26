/* gsvg.vala
 *
 * Copyright (C) 2016 Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using GXml;

public class GSvg.Base : GXml.SerializableObjectModel {
  public override string node_name () {
    string nname = get_type ().name ();
    if ("Pwmc" in nname)
    nname = nname.replace ("Gsvg","");
    return nname;
  }
  public override bool property_use_nick () { return true; }
  public override string to_string () {
    var d = new TDocument ();
    try { serialize (d); } catch { return get_type ().name (); }
    return d.to_string ();
  }
}

