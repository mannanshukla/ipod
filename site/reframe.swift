import AppKit
// The site's device shots all share one 534x1000 frame with a glare (frame.swift makes a different, plainer one).
// To add a shot: swift reframe.swift img/cardsdecks-device.png SHOT-640x960.png img/NAME-device.png
let a = CommandLine.arguments
let base = NSBitmapImageRep(data: NSImage(contentsOfFile: a[1])!.tiffRepresentation!)!
let shot = NSImage(contentsOfFile: a[2])!
let W = base.pixelsWide, H = base.pixelsHigh
let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: W, pixelsHigh: H, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
let sx = 47, sy = 168, sw = 445, sh = 667          // screen rect, top-left origin
NSGraphicsContext.saveGraphicsState(); let g = NSGraphicsContext(bitmapImageRep: rep)!; NSGraphicsContext.current = g; g.imageInterpolation = .high
base.draw(in: NSRect(x: 0, y: 0, width: W, height: H))
shot.draw(in: NSRect(x: sx, y: H - sy - sh, width: sw, height: sh), from: .zero, operation: .copy, fraction: 1)
NSGraphicsContext.restoreGraphicsState()
let p = rep.bitmapData!, bpr = rep.bytesPerRow
for y in sy..<(sy + sh) {
    let al = 0.118 - 0.00033 * Double(y - 175); if al <= 0 { continue }
    let edge = 188.0 + 1.14 * Double(y - 175)
    for x in sx..<(sx + sw) where Double(x) >= edge {
        let o = y * bpr + x * 4
        for c in 0..<3 { let v = Double(p[o + c]); p[o + c] = UInt8(min(255, v + (255 - v) * al)) }
    }
}
try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: a[3]))
