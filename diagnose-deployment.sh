#!/bin/bash

# GitHub Pages Deployment Troubleshooting Script
# This script helps diagnose common GitHub Pages deployment issues

echo "🔍 GitHub Pages Deployment Diagnostic Tool"
echo "=========================================="
echo

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository. Please run this from your repository root."
    exit 1
fi

echo "📁 Repository Information:"
echo "Repository: $(git remote get-url origin 2>/dev/null || echo 'No remote origin found')"
echo "Current branch: $(git branch --show-current 2>/dev/null || echo 'Unable to determine')"
echo "Last commit: $(git log -1 --oneline 2>/dev/null || echo 'No commits found')"
echo

# Check for required files
echo "📋 Checking Required Files:"
files_to_check=("index.html" "CNAME" "README.md")
for file in "${files_to_check[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file exists"
    else
        echo "⚠️  $file not found"
    fi
done
echo

# Check CNAME content
echo "🌐 Domain Configuration:"
if [ -f "CNAME" ]; then
    domain=$(cat CNAME | tr -d '\n\r')
    echo "Custom domain: $domain"
    
    # Test DNS resolution (if dig is available)
    if command -v dig &> /dev/null; then
        echo "🔍 DNS Check for $domain:"
        dig +short "$domain" | head -5
    else
        echo "💡 Install 'dig' to check DNS resolution"
    fi
else
    echo "No CNAME file - using default GitHub Pages domain"
fi
echo

# Check for .github/workflows directory
echo "⚙️  GitHub Actions Configuration:"
if [ -d ".github/workflows" ]; then
    echo "✅ .github/workflows directory exists"
    workflow_count=$(find .github/workflows -name "*.yml" -o -name "*.yaml" | wc -l)
    echo "📄 Found $workflow_count workflow file(s)"
else
    echo "⚠️  No .github/workflows directory found"
    echo "💡 GitHub Pages uses default Jekyll build process"
fi
echo

# Check git status
echo "📊 Git Status:"
git_status=$(git status --porcelain 2>/dev/null)
if [ -z "$git_status" ]; then
    echo "✅ Working directory clean"
else
    echo "⚠️  Uncommitted changes detected:"
    git status --short
fi
echo

# Check if main branch exists and current status
echo "🌿 Branch Information:"
if git show-ref --verify --quiet refs/heads/main; then
    echo "✅ main branch exists"
    
    # Check if current branch is main
    current_branch=$(git branch --show-current)
    if [ "$current_branch" = "main" ]; then
        echo "✅ Currently on main branch"
    else
        echo "⚠️  Currently on '$current_branch' branch, not 'main'"
        echo "💡 GitHub Pages typically deploys from 'main' branch"
    fi
    
    # Check if local main is up to date with remote
    if git rev-parse --verify origin/main &>/dev/null; then
        local_main=$(git rev-parse main 2>/dev/null)
        remote_main=$(git rev-parse origin/main 2>/dev/null)
        
        if [ "$local_main" = "$remote_main" ]; then
            echo "✅ Local main branch is up to date with remote"
        else
            echo "⚠️  Local main branch differs from remote"
            echo "💡 Run 'git push origin main' to update remote"
        fi
    else
        echo "⚠️  No remote main branch found"
    fi
else
    echo "❌ main branch does not exist"
    echo "💡 Create main branch: git checkout -b main"
fi
echo

# Provide troubleshooting recommendations
echo "🔧 Troubleshooting Recommendations:"
echo "=================================="
echo
echo "1. 🔄 Force Cache Refresh:"
echo "   - Browser: Ctrl+F5 (Windows) or Cmd+Shift+R (Mac)"
echo "   - Try incognito/private browsing mode"
echo
echo "2. 🌐 Test Different URLs:"
echo "   - GitHub Pages default: https://$(git remote get-url origin | sed 's/.*github.com[:/]\([^/]*\)\/\([^/.]*\).*/\1.github.io/')"
if [ -f "CNAME" ]; then
    echo "   - Custom domain: https://$(cat CNAME)"
fi
echo
echo "3. ⚙️  Check GitHub Repository Settings:"
echo "   - Go to Settings → Pages"
echo "   - Verify source is set to 'Deploy from a branch'"
echo "   - Verify branch is 'main' and folder is '/ (root)'"
echo
echo "4. 📈 Monitor Deployment:"
echo "   - Check Actions tab for deployment status"
echo "   - Look for any failed workflow runs"
echo
echo "5. 🌍 DNS Propagation (for custom domains):"
echo "   - Changes can take 24-48 hours to propagate globally"
echo "   - Use online DNS propagation checkers"
echo
echo "6. 📝 Make a Test Change:"
echo "   - Edit index.html with a small visible change"
echo "   - Commit and push to trigger new deployment"
echo "   - Add timestamp or version number to verify updates"
echo

echo "✅ Diagnostic complete!"
echo "💡 For immediate testing, visit: /debug.html (if available)"