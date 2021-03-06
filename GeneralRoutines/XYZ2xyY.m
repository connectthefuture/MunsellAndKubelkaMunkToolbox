function [x, y, YOut] = XYZ2xyY(X, YIn, Z);
% Purpose		Convert XYZ coordinates to xyY coordinates.
%
% Description	In 1931, the Commission Internationale de l'Eclairage (CIE) introduced
%				standards for specifying colours.  In one of these standards,
%				a coloured light source is specified by three coordinates: x, y, and Y.
%				The coordinate Y gives a colour's luminance, or relative luminance.  
%				When interpreted as a relative luminance, Y is a number between 0 and
%				100, that expresses the intensity of the source as a percentage of some
%				maximum intensity.  This percentage is calculated with regard to the
%				human photopic luminous efficiency function, which has been established
%				as part of the CIE 2 degree standard observer.  When dealing with
%				physical samples such as paints, Y is the percentage of a fixed light
%				source that a paint sample reflects (with regard to the standard 
%				observer).  
%
%				A related set of coordinates is the XYZ system.  The Y in the xyY and XYZ
%				systems is identical and has the same interpretation.  
%
%				This routine converts from XYZ coordinates to xyY coordinates, in 
%				accordance with Equations (3.15) through (3.17) in [Fairchild2005].
%
%				When Y is 0, chromaticity coordinates x and y are not defined uniquely.
%				Y is defined by integrating a transmitted light, or reflectance function,
%				over the visual spectrum (380 to 760 nm), against the CIE colour matching function given
%				by y_bar (Table 3.3 of [Fairchild2005]).  If a stimulus has a Y-value of 0,
%				then, since y_bar is 0 only at 380 nm, the stimulus must have zero value,
%				except possibly at 380 nm.  The x_bar and z_bar matching functions, from
%				which X and Z are calculated, take on very small values at 380 nm, so X
%				and Z in practical terms are 0.  For simplicity, no error checking is
%				done on X and Z when the input Y is 0.  Rather x, y, and Y, are all set to
%				0 in this case.
%
%				[Fairchild2005] Mark D. Fairchild, Color Appearance Models, 2nd ed.,
%					John Wiley & Sons, Ltd., 2005.
%
% Syntax		[x, y, YOut] = XYZ2xyY(X, YIn, Z);
%
%				X, Yin, Z		XYZ coordinates for an input colour
%
%				x, y, Yout		xyY coordinates for the input colour
%
% Related		xyY2XYZ
% Functions
%
% Required		None
% Functions		
%
% Author		Paul Centore (May 18, 2012)
%
% Copyright 2012 Paul Centore
%
%    This file is part of MunsellAndKubelkaMunkToolbox.
%
%    MunsellAndKubelkaMunkToolbox is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    MunsellAndKubelkaMunkToolbox is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with MunsellAndKubelkaMunkToolbox.  If not, see <http://www.gnu.org/licenses/>.

if YIn == 0.0			% Check for stimulus function with zero power, or zero reflectance
   x    = 0.0			;
   y    = 0.0			;
   YOut = YIn			;
else
   x    = X  /(X+YIn+Z)	;
   y    = YIn/(X+YIn+Z)	;
   YOut = YIn			;
end
return; 