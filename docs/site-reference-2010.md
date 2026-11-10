# Apple 2010 website reference

Browser-inspected on 2026-11-10:
- https://web.archive.org/web/20100831130630/http://www.apple.com/ipod/
- https://web.archive.org/web/20100902112603/http://www.apple.com/ipodtouch/

The September iPod touch launch page is the main layout reference. Its rendered DOM reports a 980px content width, approximately 38px global navigation with an 18px top margin, 53px product navigation, a 570px white hero, and 12px/18px Lucida Grande body text on #f5f6f7. It uses a silver segmented global bar, understated product navigation, blue pill CTA, product-led white stage, lower feature/promotional modules and a breadcrumb plus four-column directory.

Our adaptation retains original project names, honest compatibility information and existing photographic iPod frames. It does not use Apple's wordmark, sales claims or imply affiliation. Headers use system Helvetica fallbacks rather than redistributing proprietary Myriad. Layout responds to mobile widths instead of retaining the archive's fixed-width overflow. Product features stay readable in static sections rather than automatically cycling while a visitor reads.

## Revision after visual review

The September layout experiment was reverted on 2026-11-10 in favor of the existing glossy navigation, centered heroes, three-column app catalog and full-size feature rows. Rewind uses the same 534 × 1000 photographic device frame as the other apps, composed with `site/reframe.swift`. Capture actual screens directly over Veency/VNC at 640 × 960; do not capture the Mac Mirror window or use the experimental 320 × 480 stream. Inspect settled frames before framing them. Visual checks cover desktop, 428px mobile and 320px mobile; retain wrapping product navigation, proportional images and readable stacked feature sections.
