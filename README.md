# 이겸비 · Right Here, Right Now · MV PPM

Tina Singer music video pre-production deck (static HTML).

## Local preview

```bash
python -m http.server 8765
```

- PPM: http://127.0.0.1:8765/
- 일촬표: http://127.0.0.1:8765/callsheet/

## Pages

| Path | Description |
|------|-------------|
| `/` (`index.html`) | PPM 슬라이드 덱 |
| `/callsheet/` | **7/25 1차 촬영 일촬표** (신촌 합주실) |

## Live (works-site)

- PPM: https://works.mansejin.com/project/tinasinger/mv/ppm/
- Call sheet: https://works.mansejin.com/project/tinasinger/mv/ppm/callsheet/

Publish into `Mansejin/works-site` at `project/tinasinger/mv/ppm/`:

```bash
./scripts/sync-to-works-site.sh /path/to/works-site
# or: git -C /path/to/works-site apply deploy/works-site-callsheet.patch
```
