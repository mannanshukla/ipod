import AppKit
// 1200x630 Open Graph card that mirrors the home page hero: centered headline over the five-device lineup.
// Run from site/: swift og.swift
let W: CGFloat = 1200, H: CGFloat = 630
let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(W), pixelsHigh: Int(H), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
NSGraphicsContext.saveGraphicsState(); NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
// the hero sheet: white fading to a light gray floor
NSGradient(colors: [NSColor.white, NSColor.white, NSColor(deviceWhite: 0.90, alpha: 1)], atLocations: [0, 0.45, 1], colorSpace: .deviceRGB)!.draw(in: NSRect(x: 0, y: 0, width: W, height: H), angle: -90)

func text(_ s: String, _ font: NSFont, _ color: NSColor, _ y: CGFloat, _ h: CGFloat, kern: CGFloat = 0) {
    let p = NSMutableParagraphStyle(); p.alignment = .center
    (s as NSString).draw(in: NSRect(x: 40, y: y, width: W - 80, height: h), withAttributes: [.font: font, .foregroundColor: color, .paragraphStyle: p, .kern: kern])
}
func face(_ name: String, _ size: CGFloat) -> NSFont { NSFont(name: name, size: size) ?? NSFont.systemFont(ofSize: size) }
text("The iPod touch. Smarter.", face("HelveticaNeue", 68), NSColor(deviceWhite: 0.10, alpha: 1), 510, 86, kern: -2.2)
text("Ten native apps. A little paper, a little chrome, and Claude for your goals.", face("HelveticaNeue", 27), NSColor(deviceWhite: 0.42, alpha: 1), 458, 38)

// the home page lineup, same order and stacking: outer pair, inner pair, then the middle device on top
let lineup: [(name: String, height: CGFloat, dx: CGFloat)] = [
    ("radiotuner", 400, -430), ("cardsdecks-native", 400, 430),
    ("bursts", 468, -228), ("rewind-coverflow", 468, 228),
    ("claude-native", 540, 0),
]
let top: CGFloat = 424   // every device hangs from just under the subhead and bleeds off the bottom edge
for d in lineup {
    let dev = NSImage(contentsOfFile: "img/\(d.name)-device.png")!
    let dw = dev.size.width / dev.size.height * d.height
    let sh = NSShadow(); sh.shadowColor = NSColor(white: 0, alpha: 0.30); sh.shadowOffset = NSSize(width: 0, height: -4); sh.shadowBlurRadius = 16
    NSGraphicsContext.saveGraphicsState(); sh.set()
    dev.draw(in: NSRect(x: W / 2 + d.dx - dw / 2, y: top - (540 - d.height) * 0.45 - d.height, width: dw, height: d.height), from: .zero, operation: .sourceOver, fraction: 1)
    NSGraphicsContext.restoreGraphicsState()
}
NSGraphicsContext.restoreGraphicsState()
try! rep.representation(using: .jpeg, properties: [.compressionFactor: 0.88])!.write(to: URL(fileURLWithPath: "img/og.jpg"))
print("og ok")
