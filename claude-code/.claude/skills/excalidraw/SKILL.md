---
name: excalidraw
description: >
  Create hand-drawn style diagrams and visualizations using the Excalidraw tool.
  ALWAYS use this skill when the user asks to visualize, diagram, draw, sketch, or illustrate:
  system architecture, infrastructure, DevOps pipelines, Kubernetes clusters, network flows,
  microservices topology, CI/CD flows, data flows, sequence diagrams, entity relationships,
  cloud architecture (AWS/GCP/Azure), authentication flows, API design, or any concept that
  would benefit from a visual. Also trigger when the user says "show me", "draw", "diagram",
  "visualize", "map out", "architecture overview", or "how does X work" — even if they don't
  explicitly ask for a diagram. Excalidraw is the first tool to reach for when explanation
  would benefit from a picture. Don't wait to be asked — if a diagram would help, draw it.
---

# Excalidraw Skill

Use this skill to create clear, beautiful, hand-drawn style diagrams with the `Excalidraw:create_view` tool.
Always call `Excalidraw:read_me` ONCE at the start of a conversation before the first diagram — never again after that.

---

## Workflow

1. **read_me first** — Call `Excalidraw:read_me` if this is the first diagram in the conversation
2. **Plan layout** — Decide camera size, element positions, color scheme, flow direction
3. **Draw progressively** — Start camera → background zones → nodes → connections → labels → annotations
4. **Use checkpoints** — For multi-step diagrams, save and restore checkpoints

---

## Core Principles

### Always start with cameraUpdate
The very first element in the array must be a `cameraUpdate`. Camera sizes (4:3 ratio only):
- **S** 400×300 — close-up, 2–3 elements
- **M** 600×450 — medium section
- **L** 800×600 — standard full diagram *(default)*
- **XL** 1200×900 — large overview (font ≥ 18)
- **XXL** 1600×1200 — panorama (font ≥ 21)

### Progressive drawing order
```
cameraUpdate → background zones → shape → its label → its arrows → next shape
```
Never dump all shapes then all arrows — draw each node complete before moving on.

### Labeled shapes (preferred)
Use `label` directly on shapes instead of separate text elements:
```json
{
  "type": "rectangle", "id": "r1", "x": 100, "y": 100, "width": 200, "height": 80,
  "backgroundColor": "#a5d8ff", "fillStyle": "solid",
  "roundness": { "type": 3 },
  "label": { "text": "My Service", "fontSize": 18 }
}
```

---

## Color System

### Node Colors by Role
| Role | Background | Stroke | Use For |
|------|-----------|--------|---------|
| Input/Source | `#a5d8ff` | `#4a9eed` | User, client, ingress |
| Processing | `#d0bfff` | `#8b5cf6` | Service, agent, compute |
| Storage/Data | `#c3fae8` | `#22c55e` | DB, cache, queue, S3 |
| Output | `#b2f2bb` | `#22c55e` | Response, sink, result |
| Warning/External | `#ffd8a8` | `#f59e0b` | External API, pending |
| Error/Critical | `#ffc9c9` | `#ef4444` | Failure, alert |
| Decision | `#fff3bf` | `#f59e0b` | Config, decision, note |
| Analytics | `#eebefa` | `#ec4899` | Metrics, monitoring |

### Zone Backgrounds (opacity 30–50)
| Zone | Color | Use |
|------|-------|-----|
| Frontend | `#dbe4ff` | UI, ingress layer |
| Logic | `#e5dbff` | App, agent layer |
| Data | `#d3f9d8` | Storage, DB layer |

### Text on Colored Backgrounds
- Light fills → use dark text: `#15803d`, `#2563eb`, `#9a5030`
- Dark fills → use `#e5e5e5`
- Never use `#b0b0b0` or lighter on white

---

## Common Diagram Patterns

### Microservices Architecture
```
[API Gateway] → [Service A] → [DB A]
               → [Service B] → [Cache]
                             → [Queue] → [Worker]
```
- Use zone backgrounds to separate: Ingress / App / Data layers
- Color each service by role
- Show async flows with dashed arrows

### Kubernetes Cluster
```
[Cluster zone]
  [Namespace zone]
    [Pod] → [Service] → [Ingress]
    [Pod] ← [ConfigMap/Secret]
```
- Nested rectangles for cluster → namespace → pod
- Use light purple for control plane, light blue for workloads

### CI/CD Pipeline
Left-to-right flow:
```
[Code] → [Build] → [Test] → [Push Image] → [Deploy Staging] → [Deploy Prod]
```
- Color stages: source (blue) → build (purple) → test (amber) → deploy (green)

### Sequence Diagram
- Header boxes across the top
- Dashed vertical lifelines
- Solid arrows for requests, dashed for responses
- Camera pans progressively down the timeline

### AWS Architecture
- Use rectangle zones for VPC, subnets, AZs
- Standard color mapping: EC2=blue, RDS=teal, Lambda=purple, ALB=orange, S3=green

---

## Arrow Styles

```json
{ "type": "arrow", "id": "a1", "x": 300, "y": 150,
  "width": 150, "height": 0,
  "points": [[0,0],[150,0]],
  "endArrowhead": "arrow",
  "startBinding": { "elementId": "src", "fixedPoint": [1, 0.5] },
  "endBinding": { "elementId": "dst", "fixedPoint": [0, 0.5] } }
```

Arrow binding fixedPoints:
- right: `[1, 0.5]` | left: `[0, 0.5]` | top: `[0.5, 0]` | bottom: `[0.5, 1]`

For async/response: add `"strokeStyle": "dashed"`
For bidirectional: add `"startArrowhead": "arrow"`

---

## Multi-Camera Animation

Use multiple `cameraUpdate` entries to guide attention:
1. Start with title (M camera)
2. Zoom out to full view (L or XL)
3. Pan to each section as you draw it
4. Final zoom-out showing the complete diagram

```json
[
  { "type": "cameraUpdate", "width": 600, "height": 450, "x": 200, "y": 0 },
  // draw title...
  { "type": "cameraUpdate", "width": 1200, "height": 900, "x": 0, "y": 0 },
  // draw full diagram...
]
```

---

## Checkpoint Usage

For long or iterative diagrams:
```json
[
  { "type": "restoreCheckpoint", "id": "<checkpointId from previous response>" },
  // add new elements on top...
]
```

To delete elements (always use new IDs for replacements):
```json
{ "type": "delete", "ids": "old1,old2,old3" }
```

---

## DevOps-Specific Tips

### For DevOps/Platform/SRE context:
- **Network flows**: Left=external, Right=internal; show ports on arrows
- **Failure paths**: Use red dashed arrows for error/fallback routes
- **Security boundaries**: Bold red rectangle border for security zones (WAF, mTLS boundary)
- **Scale annotations**: Add text labels like "×3 replicas" or "auto-scaled 2–10"
- **Latency labels**: Put p99/p50 latency on critical path arrows
- **SOC2-relevant**: Highlight encryption-in-transit (lock icon via emoji-free workaround: label "TLS 1.3"), audit log paths

### Kubernetes topology conventions:
- Cluster: large light-purple zone
- Namespace: nested light-blue zone  
- Pods: small rounded rectangles
- Services: trapezoid-style (use rectangle) with "SVC" label
- Ingress: left-side entry point in orange

---

## Minimal Working Example

```json
[
  { "type": "cameraUpdate", "width": 800, "height": 600, "x": 0, "y": 0 },
  { "type": "rectangle", "id": "zone1", "x": 50, "y": 50, "width": 700, "height": 500,
    "backgroundColor": "#e5dbff", "fillStyle": "solid", "opacity": 40,
    "strokeColor": "#8b5cf6", "roundness": { "type": 3 } },
  { "type": "text", "id": "ztitle", "x": 60, "y": 60, "text": "Application Layer", "fontSize": 16, "strokeColor": "#8b5cf6" },
  { "type": "rectangle", "id": "svc1", "x": 100, "y": 200, "width": 180, "height": 80,
    "backgroundColor": "#d0bfff", "fillStyle": "solid", "roundness": { "type": 3 },
    "label": { "text": "Auth Service", "fontSize": 18 } },
  { "type": "rectangle", "id": "svc2", "x": 450, "y": 200, "width": 180, "height": 80,
    "backgroundColor": "#d0bfff", "fillStyle": "solid", "roundness": { "type": 3 },
    "label": { "text": "API Service", "fontSize": 18 } },
  { "type": "arrow", "id": "a1", "x": 280, "y": 240, "width": 170, "height": 0,
    "points": [[0,0],[170,0]], "endArrowhead": "arrow",
    "startBinding": { "elementId": "svc1", "fixedPoint": [1, 0.5] },
    "endBinding": { "elementId": "svc2", "fixedPoint": [0, 0.5] },
    "label": { "text": "JWT verify", "fontSize": 14 } }
]
```

---

## What NOT to Do
- Never call `Excalidraw:read_me` more than once per conversation
- Never use camera sizes with non-4:3 ratios (800×500 is wrong — use 800×600)
- Never use fontSize below 14
- Never use light gray text on white backgrounds
- Never reuse deleted element IDs
- Never draw all shapes then all arrows — draw progressively
- Never use emoji in text labels (Excalidraw font doesn't support them)
