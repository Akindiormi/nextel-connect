"""Install the user's brand logo and generate Android launcher icons from it.

The source logo has a transparent background with dark-green and gold marks, so
launcher icons are composited onto the light brand background (#F0F4F0) with a
rounded mask and padding, keeping every mark visible on the home screen.
"""
import os
from PIL import Image, ImageDraw

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.environ.get(
    "LOGO_SRC",
    "/root/.claude/uploads/29739059-b677-5b28-b088-bcf328369cf8/3b5dccbe-IMG_7612.png",
)
LIGHT = (240, 244, 240, 255)  # #F0F4F0


def load_logo():
    img = Image.open(SRC).convert("RGBA")
    return img


def trimmed(img):
    """Trim transparent margins so the mark fills the frame consistently."""
    bbox = img.getchannel("A").getbbox()
    return img.crop(bbox) if bbox else img


def launcher_icon(size, pad_ratio=0.16, ss=4):
    S = size * ss
    canvas = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    # rounded light background
    bg = Image.new("RGBA", (S, S), LIGHT)
    mask = Image.new("L", (S, S), 0)
    ImageDraw.Draw(mask).rounded_rectangle(
        [0, 0, S - 1, S - 1], radius=int(S * 0.235), fill=255)
    canvas.paste(bg, (0, 0), mask)

    logo = trimmed(load_logo())
    pad = int(S * pad_ratio)
    box = S - 2 * pad
    lw, lh = logo.size
    scale = min(box / lw, box / lh)
    nw, nh = int(lw * scale), int(lh * scale)
    logo_resized = logo.resize((nw, nh), Image.LANCZOS)
    ox, oy = (S - nw) // 2, (S - nh) // 2
    canvas.alpha_composite(logo_resized, (ox, oy))
    return canvas.resize((size, size), Image.LANCZOS)


def main():
    assets = os.path.join(ROOT, "assets")
    os.makedirs(assets, exist_ok=True)

    # In-app logo: keep the original transparent mark at a clean square size.
    logo = trimmed(load_logo())
    side = max(logo.size)
    square = Image.new("RGBA", (side, side), (0, 0, 0, 0))
    square.alpha_composite(logo, ((side - logo.size[0]) // 2,
                                  (side - logo.size[1]) // 2))
    square.resize((1024, 1024), Image.LANCZOS).save(
        os.path.join(assets, "logo.png"))

    densities = {
        "mipmap-mdpi": 48,
        "mipmap-hdpi": 72,
        "mipmap-xhdpi": 96,
        "mipmap-xxhdpi": 144,
        "mipmap-xxxhdpi": 192,
    }
    res = os.path.join(ROOT, "android", "app", "src", "main", "res")
    for folder, px in densities.items():
        launcher_icon(px).save(os.path.join(res, folder, "ic_launcher.png"))
    print("brand logo + launcher icons written")


if __name__ == "__main__":
    main()
