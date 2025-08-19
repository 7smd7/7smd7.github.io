<div align="center">

<h1>Mohammad Daryani – Portfolio</h1>

<p><strong>Personal developer portfolio</strong> built as a single-page, interactive experience with dark mode by default, dynamic skill visualization, timeline-based experience, and filterable project gallery. Live at: <a href="https://mohammaddaryani.dev" target="_blank" rel="noopener">mohammaddaryani.dev</a></p>

</div>

## ✨ Features

- Dark / Light theme toggle (dark is default, persisted via localStorage)
- Animated binary hero background (pure CSS, performant & subtle)
- Interactive horizontal bar skills chart (Chart.js) with category filters
- Professional experience timeline (data-driven)
- Filterable project gallery (client-side tech tag filters)
- Education & certifications section (auto-rendered list)
- Accessible semantic structure & smooth in-page navigation
- SEO optimized: meta tags (description, author, robots), Open Graph, Twitter Card, canonical URL, JSON-LD Person schema
- Crawl assets: `robots.txt` + section-fragment `sitemap.xml`
- Responsive design (Tailwind CSS utility classes, mobile-first)

## 🧱 Tech Stack

| Layer | Technology |
|-------|------------|
| Styling | Tailwind CSS (CDN) + minimal custom CSS |
| Visualization | Chart.js (skills bar chart) |
| Fonts | Google Fonts (Inter) |
| Behavior | Vanilla JavaScript (no build step) |
| Hosting | GitHub Pages (custom domain: mohammaddaryani.dev) |
| SEO | Meta tags, Open Graph, Twitter, JSON-LD | 

## 📂 Structure

```
.
├── index.html        # Core single-page application (HTML + CSS + JS inline)
├── robots.txt        # Crawl directives + sitemap reference
├── sitemap.xml       # Section-level sitemap (anchors)
├── CNAME             # Custom domain configuration for GitHub Pages
└── README.md         # Project documentation
```

All dynamic content (skills, experience, projects, certifications) defined inside `index.html` in the `resumeData` object and rendered at runtime.

## 🚀 Quick Start (Local Preview)

No build step required.

1. Clone the repo:
	```bash
	git clone https://github.com/7smd7/7smd7.github.io.git
	cd 7smd7.github.io
	```
2. Open `index.html` directly in a modern browser (or serve via a lightweight HTTP server):
	```bash
	python3 -m http.server 8000
	# Visit http://localhost:8000
	```

## 🛠 Customization

| What | Where / How |
|------|-------------|
| Name / Title | `<title>` tag & hero `<h1>` in `index.html` |
| SEO Description | `<meta name="description">` |
| Open Graph / Twitter | Update `og:*` and `twitter:*` meta tags |
| Skills / Experience | Edit `resumeData` object (skills / experience arrays) |
| Projects | Modify `resumeData.projects` (each: `name`, `desc`, `tech`) |
| Certifications | Edit `resumeData.certifications` array |
| Binary Background | CSS rule: `header:first-of-type::before` |
| Theme Defaults | Theme initialization script near bottom of `index.html` |

## ♿ Accessibility & UX Notes

- Color contrast adjusted for both themes (headings & body text).
- Theme toggle has `aria-label`.
- Smooth scrolling enhances navigation experience without altering semantics.
- Further improvements possible: skip link, ARIA roles on timeline, canvas alt fallback.

## 🔍 SEO Highlights

- Canonical URL: `https://mohammaddaryani.dev/`
- JSON-LD Person schema (name, jobTitle, sameAs links)
- Section-based `sitemap.xml` to hint importance of main content areas
- `robots.txt` allows full crawl and references sitemap
- Social preview image slot (`og:image`, `twitter:image`) – ensure the referenced asset exists at `/assets/og-image.png`

## 🧪 Testing Considerations

Given the static nature, validation focuses on:
- Lighthouse (performance / accessibility / best practices / SEO)
- Mobile responsiveness (Chrome DevTools)
- Dark/light contrast audit (e.g., using Axe or WAVE)

## 🗺 Roadmap Ideas

- Add downloadable PDF resume generation
- Add accessibility enhancements (ARIA labelling for chart data)
- Generate sitemap dynamically via script (if site expands)
- Integrate analytics (privacy-friendly) if desired
- Provide dedicated project detail subpages (deferred earlier)

## 🤝 Contributing

While this is a personal portfolio, suggestions via Issues or Pull Requests are welcome—focus on accessibility, performance, or SEO improvements.

## 📜 License

No explicit license provided yet. If you plan to reuse significant parts, open an issue to clarify terms (recommendation: MIT for simplicity).

## 👤 Author

**Mohammad Daryani**  
LinkedIn: <https://linkedin.com/in/m-daryani/>  
GitHub: <https://github.com/7smd7>

## 💡 FAQ

**Why a single HTML file?**  
Keeps deployment frictionless (just push to `main`), zero build tooling, and instantaneous edits.

**Why Tailwind via CDN instead of a build pipeline?**  
Small scale + rapid iteration; Purge/optimization can be introduced later if needed.

**How is dark mode persisted?**  
Simple `localStorage` key (`theme`) toggled by a button; default is dark unless explicitly set to light.

## 🔧 Troubleshooting GitHub Pages Deployment

If your GitHub Pages site isn't updating after pushing changes, try these solutions:

### Quick Fixes
1. **Hard Refresh**: `Ctrl+F5` (Windows) or `Cmd+Shift+R` (Mac)
2. **Incognito Mode**: Test in private/incognito browsing
3. **Check Debug Page**: Visit `/debug.html` for diagnostic information
4. **Run Diagnostic Script**: `./diagnose-deployment.sh` (if on Unix/Linux/Mac)

### Common Issues

**Custom Domain Not Working**
- Verify CNAME file contains only: `mohammaddaryani.dev`
- Check DNS settings point to `7smd7.github.io`
- DNS changes can take 24-48 hours to propagate

**Changes Not Appearing**
- Ensure you're pushing to the `main` branch
- Check Actions tab for deployment status
- Browser cache may be showing old version

**GitHub Pages Settings**
- Go to Settings → Pages
- Source: "Deploy from a branch"
- Branch: `main` / `/ (root)`
- Custom domain: `mohammaddaryani.dev`

### Deployment Verification
- Check the timestamp in the footer of the live site
- Compare with your latest commit time
- Monitor GitHub Actions for successful deployments

### Force New Deployment
```bash
# Make a small change to trigger deployment
echo "<!-- Updated $(date) -->" >> index.html
git add index.html
git commit -m "Force deployment update"
git push origin main
```

---

If you find a rendering or accessibility issue, please open an Issue with browser + OS details.

Thanks for visiting the portfolio repo! 🙌
