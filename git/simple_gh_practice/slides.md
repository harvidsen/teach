---
theme:
  override:
    default:
      margin:
        percent: 8
---

# Git og GitHub gode praksiser

- Kort forklare git konsepter
- Vise hvordan vi bruker dette i Kodekraft klubben
- Gevinst

<!-- end_slide -->


**Origin**, lokal **clone** og interaksjon mellom de.

```mermaid +render
---
config:
  flowchart:
    defaultRenderer: elk
---
graph BT
    Origin("☁️ Origin (GitHub)")
    Local("💻 Local Clone")
    User("👤 User")

    Origin -- "clone / pull / fetch" --> Local
    Local -- "push" --> Origin
    User -- "commit" --> Local
```

<!-- end_slide -->


**Commit**, **branch** og **merge**

```mermaid +render
%%{init: { 'gitGraph': {'rotateCommitLabel': false} } }%%
gitGraph BT:
    commit id: "init"
    commit id: "add readme"
    branch feature
    checkout feature
    commit id: "new feature"
    commit id: "fix bug"
    checkout main
    commit id: "hotfix"
    merge feature id: "merge feature"
    commit id: "release"
```

<!-- end_slide -->


# Git verktøy

Ulike verktøy, men alle gjør det samme

- `git` cli
- `lazygit`
- VSCode
- Andre IDE'er med git integrasjon
- Ikke så farlig akkurat hvilket verktøy, alt bruker git cli i bakgrunnen.

-> Praksis?
  - Hvis du liker en pen visuell museklikk-opplevelse -> VSCode med GitLens extension.
  - Eller terminal hotkey-opplevelse -> `lazygit`

# Andre verktøy

- [`gh`](https://cli.github.com/) cli for å ha GitHub spesifikke ting i terminal. 
  - Dette er et tillegg til `git` cli

<!-- end_slide -->


# _Kodekraft_ praksis:

- Husk å sørge for at ting er oppdatert
- Alltid jobb på en *feature branch*
- Merge til main via Pull Request

# En vanlig  arbeidsflyt

- clone
  - `gh repo clone harvidsen/teach`
- pull latest main
- make new branch
- make changes
  - Untracked, unstaged, staged, commit
- push commited
- Pull Request
- merge
- blame

---

Demo med VSCode og gitlens extension commit graph
<!-- end_slide -->


# Gevinster

- Kommer av seg selv
  - Versjonskontroll
  - Samarbeid og deling
- PR sjekker
- Dokumentasjon sammen med kode
- Single source of truth

<!-- end_slide -->


Våre dokumenterte krav for kode i produksjon, [RFC15](https://github.com/fornybar/rfcs/blob/main/0015-production-requirements/0015-production-requirements.md).
