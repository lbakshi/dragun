# Egg prototype

The first Dragun prototype is an egg and nest, together no larger than a shoebox. It needs a speaker, networking, a camera, and an expressive LED display that appears to be within the eggshell surface.

## Organization

- `bom/` — version-controlled bills of materials; distinguish candidate parts from selected parts and record substitutions when a build is made.
- `mechanical/` — shell, nest, mounts, assembly designs, and CAD exports.
- `electrical/` — wiring diagrams, component details, and circuit designs.
- `validation/` — test procedures and results for the prototype.

Keep design files and the associated parts list in Git so a commit or tag can identify the revision used for a build. A CAD fit or a listed component is not evidence of physical performance or current availability.
