;+
; NAME:
;       TV_24
;
; PURPOSE:
;       This procedure displays a 24-bit image on the current
;       graphics device, constructing a custom colour table if
;       the device supports less than 257 colours.
;
; CATEGORY:
;       Graphics.
;
; CALLING SEQUENCE:
;       TV_24(image)
;
; INPUTS:
;       IMAGE: the pixel-interleaved, 24-bit image to be displayed.
;              IMAGE should be of type BYTARR(3,M,N).
;
; KEYWORD PARAMETERS:
;       None. 
;
; COMMON BLOCKS:
;       None.
;
; SIDE EFFECTS:
;       On 8-bit displays the current colour table is overwritten,
;       on 24-bit displays it is preserved.
;
; RESTRICTIONS:
;       None.
;
; EXAMPLE:
;       Display a 24-bit image on an 8-bit display:
;            TV_24(image)
;       
;
; MODIFICATION HISTORY:
;       Part of Struan's Surface Tutorial: 
;            http://www.sljus.lu.se/stm/IDL/Surf_Tips/
;       Written by:	Struan Gray, Sljusfysik, Lunds Universitet, 970305.
;-

pro tv_24, image

 if !d.n_colors gt 256 then begin
   tvlct, red, grn, blu, /get
   tvlct, indgen(256), indgen(256), indgen(256)
   tv, image, true=1
   tvlct, red, grn, blu
 endif else begin
   psuedo_img = color_quan(image, 1, red, grn, blu, /dither)
   tvlct, red, grn, blu
   tv, psuedo_img
 endelse

end   ; pro tv_24
