/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* css-classes.vala
 *
 * Copyright (C) 2017 Daniel Espinosa <daniel.espinosa@pwmc.mx>
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

// FIXME: This should be moved to its own library

/**
 * CSS interfaces according with https://www.w3.org/TR/SVG/ version 1.1
 */
public class GsCSSStyleDeclaration : Object,
                                    GomProperty,
                                    CSSStyleDeclaration
{
  public string        css_text { get; set; }
  public uint          length { get; set; }
  public CSSRule       parent_rule { get; set; }

  public string        get_property_value (string property_name) { return ""; }
  public CSSValue      get_property_css_value (string property_name) { return null; }
  public string        remove_property (string property_name) throws GLib.Error { return ""; }
  public string        get_property_priority (string property_name) { return ""; }
  public void          set_property (string property_name,
                                     string value,
                                     string priority) throws GLib.Error { return; }
  public string        item (uint index) { return ""; }
  // GomProperty
  public string?        value {
    owned get { return css_text; }
    set { css_text = value; }
  }

  public bool validate_value (string val) {
    return true; // FIXME:
  }
}

} // GSvg
