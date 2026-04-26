# 2D Platformer/Puzzle Game — BITROT

BITROT
You are a lost pointer in a dying machine. Your instructions are clear: point to your destination. The problem? The destination header is corrupted, the memory banks are decaying, and a NullPointerException is a death sentence.

In BITROT, a precision 2D platformer, you must navigate the skeletal remains of an outdated OS. To survive the encroaching system failure, you won’t just jump and dash— you’ll debug.

Core Gameplay
- Execute & Traverse: Move through a fractured digital world where the platforms are as unstable as the code they’re built on.

- CTRL-C, CTRL-V: Connect broken lines of code in real-time to bridge gaps, bypass logic gates, and rewrite the environment to your advantage.

- Memory Recovery: Collect fragmented data packets to reconstruct your original assignment and discover what—or who—you were meant to find.

The Mission
The system is crashing, the sectors are rotting, and the garbage collector is closing in. Find your address. Initialize your purpose. Don't return Null.

---

## Credits

# Developers
Darryll Eral, Lance Chan, Glenshayne Belarmino

# Extras
Chrisnel Caipang, Gian Cedrick Epilan, Harold Shichiya Amistad

# Artists
Sophia Logarta, John Anthony Besañez, Ricksmer Cabatingan

---

## Getting Started

### Requirements
- [Godot 4](https://godotengine.org/download) (make sure everyone uses the same version)
- [GitHub Desktop](https://desktop.github.com/)
- [Git Bash](https://git-scm.com/downloads) *(optional, for terminal users)*

---

## Setting Up the Project (GitHub Desktop + Godot)

### 1. Clone the Repository
1. Open **GitHub Desktop**
2. Go to **File → Clone Repository**
3. Find the repo and choose a local path on your machine
4. Click **Clone**

### 2. Open the Project in Godot
1. Open **Godot 4**
2. Click **Import** on the Project Manager screen
3. Browse to the folder where you cloned the repo
4. Select the `project.godot` file
5. Click **Import & Edit**

### 3. Your Daily Workflow
After making changes in Godot:
1. Save your scenes and scripts in Godot (`Ctrl + S`)
2. Switch to **GitHub Desktop** — your changes will appear automatically
3. Write a short commit message describing what you changed
4. Click **Commit to main** (or your branch)
5. Click **Push origin** to upload your changes

To get your teammates' latest changes:
- Click **Fetch origin** then **Pull** in GitHub Desktop

---

## Using Git in the Terminal (Git Bash)

If you prefer working with the terminal instead of GitHub Desktop:

### Initial Setup
```bash
# Set your Git identity (first time only)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

### Cloning the Repo
```bash
git clone https://github.com/your-org/your-repo-name.git
cd your-repo-name
```

### Daily Workflow
```bash
# Pull latest changes from the team before starting work
git pull

# Check what files you've changed
git status

# Stage your changes
git add .

# Commit with a message
git commit -m "Your commit message here"

# Push to GitHub
git push
```

### Working with Branches *(recommended for features)*
```bash
# Create and switch to a new branch
git checkout -b feature/your-feature-name

# Push branch to GitHub
git push -u origin feature/your-feature-name

# Switch back to main
git checkout main

# Merge a branch into main
git merge feature/your-feature-name
```

---

## Project Directory

```
res://
├── Assets/
│   ├── Fonts/
│   ├── Sounds/
│   ├── Sprites/
│   └── testAssets/
├── Autoloads/
├── Scenes/
│   ├── Levels/
│   │   ├── Level_1.tscn
│   │   ├── Level_2.tscn
│   │   ├── Level_3.tscn
│   │   └── TestLevel.tscn
│   ├── Objects/
│   │   ├── Obstacles.tscn
│   │   └── Platform.tscn
│   ├── Player/
│   │   ├── Player.gd
│   │   └── Player.tscn
│   └── UI/
│       ├── HUD.tscn
│       └── MainMenu.tscn
└── Scripts/
    ├── AudioManager.gd
    ├── GameManager.gd
    ├── PlayerManager.gd
    └── SaveManager.gd
```

### What Each Script Does
| Script | Description |
|---|---|
| `GameManager.gd` | Global game state — level tracking, respawning, win/lose |
| `PlayerManager.gd` | Player state — stats, inventory (to be expanded) |
| `AudioManager.gd` | Global audio — SFX and music playback |
| `SaveManager.gd` | Save/load game progress |

---

## Notes
- All scripts in `Scripts/` are registered as **Autoloads** (singletons) under `Project → Project Settings → Globals → Autoload`
- Use `TestLevel.tscn` for testing mechanics — do not use it as a final level
- Avoid pushing the `.godot/` folder — it is listed in `.gitignore` and auto-generated locally
