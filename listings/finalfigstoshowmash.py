# -*- coding: utf-8 -*-
# coding: utf-8
TA = open_typefile(filename, 'arteries')
TV = open_typefile(filename, 'veins')
T = merge_widths(TA, TV, strategy='arteries')
from scoring import merge_widths
T = merge_widths(TA, TV, strategy='arteries')
T
plt.imshow(T)
plt.show()
confusion(approx, T!=0)
from scoring import confusion
confusion(approx, T!=0)
plt.imshow(_[crop])
plt.show()
approx
from scoring import mcc
mcc(approx, T!=0)
mcc(approx, T!=0, bg_mask=img.mask)
mcc(approx, T<19), bg_mask=img.mask)
mcc(approx, T<19, bg_mask=img.mask)
from scoring import filter_widths
mcc(approx, filter_widths(T,max_width=17), bg_mask=img.mask)
mcc(approx, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
plt.imshow(filter_widths(T,max_width=17)!=0)
plt.show()
confusion(approx, filter_widths(T, max_width=17)!=0)
plt.show()
plt.imshow(_)
plt.show()
scales
scales[:-5]
F[:,:,:-5]
F[:,:,:-5].max(axis=-1)
F[:,:,:-5].max(axis=-1) > .15
approx2 = _
plt.imshow(approx2)
plt.show()
confusion(approx2, filter_widths(T, max_width=17)!=0)
plt.imshow(_)
plt.show()
confusion(approx2, filter_widths(T, max_width=15)!=0)
plt.imshow(_[crop])
plt.show()
confusion(approx2, filter_widths(T, max_width=17)!=0)
plt.imshow(_[crop])
plt.show()
scales
F[:,:,:12]
plt.imshow(_.max(axis=-1) > .15)
plt.show()
plt.imshow(F[:,:,5:].max(axis=-1) > .15)
plt.imshow(_)
plt.imshow(F[:,:,:5].max(axis=-1) > .15)
plt.imshow(_)
plt.show()
approx3=(F[:,:,:5].max(axis=-1) > .15)
confusion(approx3, filter_widths(T, max_width=17)!=0)
plt.imshow(_)
plt.show()
scales
scales[3:-5]
scales[5:-5]
approx3=(F[:,:,5:-5].max(axis=-1) > .15)
confusion(approx3, filter_widths(T, max_width=17)!=0)
plt.imshow(_)
plt.show()
confusion(approx3, filter_widths(T, max_width=15)!=0)
plt.imshow(_)
plt.show()
mcc(approx3, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(approx2, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(approx, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(approx, filter_widths(T,max_width)!=0, bg_mask=img.mask)
mcc(approx, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,5:-1].max(axis=-1) > .15, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,4:-1].max(axis=-1) > .15, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,0:-1].max(axis=-1) > .15, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,0:-1].max(axis=-1) > .1, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,0:-2].max(axis=-1) > .1, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,1:-2].max(axis=-1) > .1, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,5:-2].max(axis=-1) > .1, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,5:-1].max(axis=-1) > .1, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,4:-1].max(axis=-1) > .1, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,1:-1].max(axis=-1) > .1, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,1:-1].max(axis=-1) > .15, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,4:-1].max(axis=-1) > .15, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,4:-1].max(axis=-1) > .15, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,4:-1].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,5:-1].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,6:-1].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,8:-1].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,10:-1].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,10:].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,12:].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,15:].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,20:].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,30:].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,25:].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,26:].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,24:].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
mcc(F[:,:,:].max(axis=-1) > .15, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,:].max(axis=-1) > .2, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,:].max(axis=-1) > .15, filter_widths(T,max_width=19)!=0, bg_mask=img.mask)
mcc(F[:,:,24:-1].max(axis=-1) > .15, filter_widths(T,max_width=17)!=0, bg_mask=img.mask)
from skimage.morphology import medial_axis, skeletonize
C
W
T
T.max()
skeletonize(T)
skeletonize(T!=0)
plt.imshow(_, cmap=plt.cm.binary)
plt.show()
get_ipython().magic('who ')
TA
plt.imshow(TA)
plt.show()
merge_widths(TA,TV)
TT = _
plt.imshow(TT)
plt.show()
TA
TA
from scoring import get_widths_from_trace
get_widths_from_trace(WA)
get_widths_from_trace(TA)
skeletonize(get_widths_from_trace(TA)!=0)
plt.imshow(_)
plt.show()
WA = get_widths_from_trace(TA)
WV = get_widths_from_veins(TV)
WV = get_widths_from_trace(TV)
from skimage.filters import sobel
sobel(img)
plt.imshow(_)
plt.show()
S = sobel(img)
from plate_morphology import dilate_boundary
dilate_boundary(S, radius=10)
dilate_boundary(S, mask=img.mask, radius=10)
plt.imshow(_)
plt.show()
dilate_boundary(S, mask=img.mask, radius=10).filled(0)
plt.imshow(_)
plt.show()
S = dilate_boundary(S, mask=img.mask, radius=10).filled(0)
plt.imshow(np.logical_or(S>S.mean(), approx))
plt.show()
S
plt.imshow(S)
plt.imshow(S)
plt.show()
plt.imshow(S[crop])
plt.show()
from frangi import frangi_from_image
get_ipython().magic('pinfo frangi_from_image')
frangi_from_image(S, sigma=3)
plt.imshow(_)
plt.show()
frangi_from_image(ma.masked_array(S, mask=img.mask), sigma=1)
plt.imshow(_)
plt.show()
frangi_from_image(ma.masked_array(S, mask=img.mask).filled(0), sigma=1)
frangi_from_image(ma.masked_array(S, mask=img.mask), sigma=1).filled(0)
plt.imshow(_)
frangi_from_image(ma.masked_array(S, mask=img.mask), sigma=1).filled(0)
plt.imshow(_[crop])
plt.show()
frangi_from_image(ma.masked_array(S, mask=img.mask), sigma=.5).filled(0)
plt.imshow(_)
plt.show()
frangi_from_image(ma.masked_array(S, mask=img.mask), sigma=1).filled(0)
plt.imshow(_)
plt.show()
fs = frangi_from_image(ma.masked_array(S, mask=img.mask), sigma=1).filled(0)
plt.imshow(fs[crop] > .15)
plt.show()
plt.imshow(fs[crop] > .1)
plt.show()
plt.imshow(fs[crop] > .01)
plt.show()
fs
fs.max()
plt.imshow(fs[crop] > .001)
plt.imshow(_)
plt.imshow(fs > .001)
plt.show()
plt.imshow(fs > .0001)
plt.show()
plt.imshow(fs > .0005)
plt.show()
plt.imshow(np.logical_or(fs > .0001,approx))
plt.show()
plt.imshow(np.logical_or(fs > .0005,approx))
plt.show()
capprox = np.logical_or(fs > .0005,approx)
confusion(capprox, trace)
plt.show()
plt.imshow(_)
plt.show()
mcc(capprox, trace, bg_mask=img.mask)
capprox
plt.imshow(capprox)
plt.show()
from skimage.morphology import binary_closing
get_ipython().magic('pinfo binary_closing')
binary_closing(capprox)
plt.imshow(_)
plt.show()
mcc(binary_closing(capprox), trace)
mcc(binary_closing(capprox), trace, bg_mask=img.mask)
sobel(S)
frangi_from_image(S)
frangi_from_image(ma.masked_array(S, mask=img.mask), sigma=1.)
margin = _
plt.imshow(margin.filled(0)[crop])
plt.show()
margin
get_ipython().magic('pinfo margin.mean')
plt.imshow(margin)
plt.show()
plt.imshow()
frangi_from_image(ma.masked_array(dilate_boundary(sobel(img), radius=10, mask=img.mask), mask=img.mask), sigma=1.)
frangi_from_image(dilate_boundary(sobel(img), radius=10, mask=img.mask), sigma=1.)
frangi_from_image(dilate_boundary(sobel(img), radius=10, mask=img.mask), sigma=.80)
plt.imshow(_.filled(0))
plt.show()
plt.imshow(_.filled(0) > .001)
frangi_from_image(dilate_boundary(sobel(img), radius=10, mask=img.mask), sigma=.80)
margin = _
margin > .0001
plt.imshow(_.filled(0))
plt.show()
np.logical_and(margin > .001, approx)
plt.imshow(_)
plt.show()
np.logical_or(margin > .001, approx)
plt.show()
plt.imshow(_)
plt.show()
mcc(np.logical_or(margin > .001, approx), trace)
mcc(binary_closingn(np.logical_or(margin > .001, approx)), trace)
mcc(binary_closing(np.logical_or(margin > .001, approx)), trace)
binary_closing(np.logical_or(margin > .001, approx)
binary_closing(np.logical_or(margin > .001, approx))
plt.imshow(_)
plt.show()
binary_closing(np.logical_or(margin > .001, approx).filled(0))
plt.show()
plt.imshow(_)
plt.show()
binary_closing(np.logical_or(margin > .001, approx).filled(0))
capprox = _
plt.imshow(_)
plt.show()
mcc(capprox, trace)
mcc(capprox, trace, mask=img.mask)
mcc(capprox, trace, bg_mask=img.mask)
binary_closing(np.logical_or(margin > .0005, approx).filled(0))
capprox = _
mcc(capprox, trace)
mcc(capprox, trace, bg_mask=img.mask)
get_ipython().magic('pinfo save')
get_ipython().magic('save finalfigstoshowmash.py 1-263')
