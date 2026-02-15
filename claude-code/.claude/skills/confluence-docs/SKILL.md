---
name: confluence-docs
description: Create and structure technical documentation for Confluence. Use when user wants to write runbooks, technical guides, API documentation, architecture decision records (ADRs), incident postmortems, onboarding docs, or any technical knowledge base content. Triggers include mentions of "Confluence", "wiki", "knowledge base", "technical docs", "runbook", "ADR", "postmortem", or requests to document systems, processes, or technical decisions.
---

# Confluence Technical Documentation

This skill helps create production-ready technical documentation optimized for Confluence. It focuses on clarity, discoverability, and maintainability for engineering teams.

## When to Use This Skill

**Trigger conditions:**
- User mentions Confluence, wiki, or knowledge base
- Requests for runbooks, playbooks, or operational guides
- Technical documentation: API docs, architecture docs, system guides
- ADRs (Architecture Decision Records) or technical RFCs
- Incident postmortems or retrospectives
- Onboarding documentation or team guides
- SOPs (Standard Operating Procedures)

**Initial Assessment:**

Ask the user:
1. What type of technical documentation is this?
   - Runbook/Playbook (operational procedures)
   - Architecture Documentation (system design, ADRs)
   - API/Integration Documentation
   - Incident Postmortem
   - Onboarding/Guide
   - Other (specify)

2. Who is the target audience?
   - Engineers (what level: junior, senior, staff?)
   - DevOps/SRE/Platform teams
   - Product/Business stakeholders
   - External users/customers
   - Cross-functional (mixed audience)

3. What's the primary goal?
   - Enable troubleshooting/incident response
   - Explain system architecture/decisions
   - Onboard new team members
   - Document API/integration patterns
   - Share knowledge after incident
   - Other (specify)

4. Is there an existing template or format to follow?
   - Link to example page or template
   - Mention any company-specific conventions
   - Provide screenshots if helpful

## Document Type Templates

### Runbook/Playbook Structure

**Essential sections:**
```
1. Overview
   - What this system/service does
   - When to use this runbook
   - Related systems/dependencies

2. Quick Reference
   - Service URLs (dashboard, logs, metrics)
   - Key contacts (teams, on-call)
   - Escalation path

3. Common Issues
   - [Issue Name]
     • Symptoms
     • Root cause
     • Resolution steps
     • Prevention

4. Troubleshooting Guide
   - Initial investigation steps
   - Where to look (logs, metrics, traces)
   - Common commands/queries

5. Operational Procedures
   - Deployment process
   - Rollback procedure
   - Configuration changes
   - Scaling operations

6. Architecture Context
   - System diagram
   - Data flow
   - Integration points
   - Critical dependencies

7. Monitoring & Alerts
   - Key metrics to watch
   - Alert definitions
   - Response playbooks

8. Resources
   - Code repositories
   - Dashboards links
   - Related documentation
```

**Best practices:**
- Start with "Quick Reference" for time-critical scenarios
- Use expandable sections for detailed procedures
- Include actual commands with copy-paste examples
- Add screenshots for dashboard locations
- Link to related runbooks
- Include "Last Updated" date and owner

### Architecture Decision Record (ADR)

**Essential sections:**
```
1. Status
   - [Proposed | Accepted | Deprecated | Superseded]
   - Date: YYYY-MM-DD

2. Context
   - What problem are we solving?
   - What constraints exist?
   - What's the current state?

3. Decision
   - What did we decide?
   - Clear, specific statement

4. Consequences
   - Positive outcomes
   - Negative outcomes / trade-offs
   - Implementation impact
   - Operational impact

5. Alternatives Considered
   - [Alternative 1]
     • Pros
     • Cons
     • Why not chosen
   - [Alternative 2]
     • ...

6. Implementation Notes
   - Key technical details
   - Migration path if applicable
   - Timeline considerations

7. References
   - Related ADRs
   - External resources
   - RFCs or design docs
```

**Best practices:**
- Be specific: "Use PostgreSQL" not "Use a database"
- Explain the "why" behind the decision
- Document what you rejected and why
- Keep it concise (1-2 pages max)
- Link to deeper technical specs if needed
- Use tables for comparing alternatives

### API Documentation

**Essential sections:**
```
1. Overview
   - Purpose of this API
   - Version information
   - Authentication method

2. Getting Started
   - Base URL
   - Authentication setup
   - Rate limits
   - Quick example (curl/code)

3. Endpoints
   For each endpoint:
   - HTTP method and path
   - Description
   - Request parameters
     • Path parameters
     • Query parameters
     • Request body schema
   - Response format
     • Success response (200, 201)
     • Error responses (400, 401, 404, 500)
   - Example request
   - Example response

4. Common Patterns
   - Pagination
   - Filtering/Sorting
   - Batch operations
   - Webhooks (if applicable)

5. Error Handling
   - Error code reference
   - Common error scenarios
   - Retry logic

6. SDKs & Libraries
   - Available client libraries
   - Code examples in major languages

7. Changelog
   - Recent updates
   - Breaking changes
   - Deprecation notices
```

**Best practices:**
- Use code blocks with syntax highlighting
- Include working curl examples
- Show both request and response JSON
- Document edge cases and error scenarios
- Add interactive examples if possible
- Keep examples realistic (not foo/bar)

### Incident Postmortem

**Essential sections:**
```
1. Summary
   - What happened (one sentence)
   - Impact (users affected, duration)
   - Severity level
   - Date/Time (with timezone)

2. Timeline
   - HH:MM - Detection
   - HH:MM - Investigation began
   - HH:MM - Root cause identified
   - HH:MM - Mitigation applied
   - HH:MM - Service restored
   - HH:MM - Monitoring confirmed stable

3. Root Cause Analysis
   - What went wrong (technical details)
   - Why it happened
   - Why it wasn't caught earlier

4. Impact Assessment
   - User impact (quantify if possible)
   - Business impact
   - Downstream effects
   - Data integrity check results

5. Resolution
   - What was done to fix it
   - Temporary vs permanent fix
   - Verification steps

6. Action Items
   - [Priority] [Owner] [Due Date] - Action item
   - Track in table format
   - Link to tickets

7. Lessons Learned
   - What went well
   - What could be improved
   - Questions raised

8. Prevention
   - How to prevent recurrence
   - Monitoring improvements
   - Process changes
```

**Best practices:**
- Blameless tone - focus on systems, not people
- Be specific with times (include timezone)
- Quantify impact when possible
- Create actionable follow-ups with owners
- Link to relevant logs/graphs
- Include incident commander notes
- Reference related incidents

### System Architecture Documentation

**Essential sections:**
```
1. Overview
   - System purpose and scope
   - High-level architecture diagram
   - Key technologies used

2. Components
   For each major component:
   - Purpose
   - Technology stack
   - Responsibilities
   - Interfaces/APIs
   - Scalability characteristics

3. Data Flow
   - Request lifecycle diagrams
   - Data persistence strategy
   - Caching layers
   - Message queues/events

4. Infrastructure
   - Deployment topology
   - Network architecture
   - Load balancing
   - Auto-scaling configuration

5. Dependencies
   - External services
   - Internal dependencies
   - Failure modes
   - Circuit breakers/fallbacks

6. Security
   - Authentication/Authorization
   - Data encryption
   - Compliance considerations (SOC2, etc.)
   - Secret management

7. Operations
   - Monitoring strategy
   - Logging approach
   - Deployment process
   - Disaster recovery

8. Performance Characteristics
   - Expected throughput
   - Latency targets
   - Resource utilization
   - Bottlenecks

9. Future Considerations
   - Known limitations
   - Planned improvements
   - Tech debt
```

**Best practices:**
- Use diagrams liberally (Mermaid, Draw.io, Lucidchart)
- Include both logical and physical architecture
- Document the "why" for major decisions
- Link to ADRs for key choices
- Keep diagrams up to date
- Use consistent notation
- Add capacity/scale information

## Content Creation Guidelines

### Writing Style for Technical Docs

**Clarity Principles:**
- **Active voice**: "The service restarts" not "The service is restarted"
- **Present tense**: "The API returns" not "The API will return"
- **Direct**: "Check the logs" not "You might want to check the logs"
- **Precise**: "Restart the pod" not "Fix the issue"

**Structure:**
- Start with context/overview
- Use progressive disclosure (high-level → details)
- Put actionable info first in runbooks
- Use numbered lists for sequential steps
- Use bullet points for unordered items
- Keep paragraphs short (3-5 lines max)

**Technical Accuracy:**
- Include version numbers where relevant
- Use exact command syntax
- Specify required permissions/roles
- Document environment-specific differences
- Note assumptions explicitly

### Confluence-Specific Formatting

**Leverage Confluence features:**
- **Info/Warning/Note panels**: For callouts
- **Code blocks**: With language syntax highlighting
- **Expand sections**: For optional details
- **Status macros**: For ADR status, incident severity
- **Inline comments**: For team collaboration
- **Page properties**: For structured metadata
- **Table of contents**: For long documents
- **Anchors**: For deep linking to sections

**Optimization tips:**
- Add labels/tags for discoverability
- Use child pages for sub-topics
- Link liberally to related pages
- Include breadcrumb context
- Add "Last Updated" date
- Assign page owners
- Set up page watchers for key docs

### Code and Command Examples

**Format guidelines:**
```bash
# Always include comments explaining what the command does
kubectl get pods -n production --selector=app=api

# Show expected output when helpful
# Output:
# NAME                   READY   STATUS    RESTARTS   AGE
# api-5d4f6b7c8d-7xk2m  1/1     Running   0          2d
```

**For code blocks:**
- Use appropriate syntax highlighting (bash, python, yaml, json)
- Include full context (imports, configuration)
- Show working examples, not pseudocode
- Add comments for non-obvious logic
- Specify required environment/dependencies

**For configuration files:**
```yaml
# Always show the full path in a comment
# File: /etc/app/config.yaml

apiVersion: v1
kind: Service
metadata:
  name: my-service
  # Explain non-obvious fields
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
```

### Diagrams and Visuals

**When to include diagrams:**
- Architecture overviews
- Data flow visualization
- Sequence diagrams for API interactions
- Network topology
- Deployment pipelines
- State machines

**Diagram types:**
- **System diagrams**: Use rectangles for services, cylinders for databases, clouds for external services
- **Sequence diagrams**: Show request/response flows
- **Flowcharts**: For decision trees and troubleshooting paths
- **Network diagrams**: Show security boundaries, VPCs, subnets

**Best practices:**
- Keep diagrams simple (max 7-10 components)
- Use consistent notation
- Add a legend if needed
- Export as PNG/SVG for Confluence
- Include source file link (Draw.io, Mermaid)
- Add alt text for accessibility
- Update diagrams when architecture changes

### Troubleshooting Sections

**Effective troubleshooting format:**
```
## [Problem Description]

**Symptoms:**
- What the user sees
- Error messages (exact text)
- When it occurs

**Diagnosis:**
1. Check [specific metric/log]
   ```bash
   # Exact command
   ```
2. Verify [specific condition]
3. Look for [specific pattern]

**Root Cause:**
Explain the underlying issue

**Resolution:**
1. Step-by-step fix
2. With verification after each step
3. Expected output at each stage

**Prevention:**
- How to prevent this in future
- Monitoring to add
- Process changes needed
```

## Document Lifecycle Management

### Before Publishing

**Pre-publication checklist:**
- [ ] Technical accuracy verified
- [ ] Commands tested in correct environment
- [ ] Links verified (no broken links)
- [ ] Code examples work as written
- [ ] Diagrams are current
- [ ] Sensitive info removed (credentials, IPs)
- [ ] Compliance reviewed (if needed)
- [ ] Peer review completed
- [ ] Labels/tags added
- [ ] Page owner assigned

### Maintenance Strategy

**Keep docs fresh:**
- Add "Last Updated" date at top
- Set up review cadence (quarterly for critical docs)
- Archive outdated content (don't delete)
- Use "Outdated" warning macro when needed
- Link to newer versions
- Track page analytics (view count)

**Ownership:**
- Assign DRI (Directly Responsible Individual)
- Tag relevant teams
- Set up watchers for critical pages
- Document in page properties

## Common Pitfalls to Avoid

**Content issues:**
- ❌ Assuming too much context
- ❌ Using "we" without defining who
- ❌ Writing in future tense for current state
- ❌ Vague troubleshooting steps ("check the logs")
- ❌ Missing version/environment info
- ❌ Copy-pasting without testing
- ❌ No examples or only pseudocode
- ❌ Walls of text without structure

**Confluence issues:**
- ❌ Not using page hierarchy
- ❌ Poor naming (use descriptive titles)
- ❌ No labels/tags for discovery
- ❌ Broken links to other pages
- ❌ Screenshots without context
- ❌ No table of contents for long pages
- ❌ Forgetting to restrict sensitive pages

## Collaboration Features

**Use Confluence collaboration tools:**
- **Inline comments**: For questions or suggestions during review
- **Page mentions**: Tag relevant people (@username)
- **Page sharing**: Set appropriate permissions
- **Change tracking**: Review page history for edits
- **Draft mode**: Work on content before publishing
- **Templates**: Create team-specific templates

## Integration with Other Tools

**Link to external resources:**
- **GitHub**: Link to code, PRs, commits
- **Jira**: Link to tickets, epics
- **Dashboards**: Grafana, Datadog, New Relic
- **Slack**: Link to discussion threads
- **Calendar**: Link to incident timeline
- **PagerDuty**: Link to incident records

## Document Creation Workflow

### Step 1: Initial Structure

1. Clarify document type and audience
2. Choose appropriate template
3. Create outline with all sections
4. Get template approval if needed

### Step 2: Content Drafting

1. Fill in sections iteratively
2. Start with high-value sections
3. Add examples and code blocks
4. Create/update diagrams
5. Add links to related resources

### Step 3: Technical Review

1. Test all commands and code examples
2. Verify technical accuracy
3. Check for completeness
4. Validate against current system state

### Step 4: Peer Review

1. Share with relevant stakeholders
2. Use inline comments for feedback
3. Address review comments
4. Get sign-off from DRI

### Step 5: Publishing

1. Complete pre-publication checklist
2. Add metadata (labels, properties)
3. Publish to appropriate space
4. Notify relevant teams
5. Add to team index/navigation

### Step 6: Maintenance

1. Set review reminder
2. Monitor for staleness
3. Update when systems change
4. Respond to inline comments/questions

## Examples by Document Type

### Example: API Endpoint Documentation

```markdown
## POST /api/v1/payments

Create a new payment transaction.

**Authentication:** Required (Bearer token)

**Rate Limit:** 100 requests/minute

### Request

**Headers:**
```
Content-Type: application/json
Authorization: Bearer {token}
Idempotency-Key: {unique-key}
```

**Body:**
```json
{
  "amount": 1000,
  "currency": "USD",
  "payment_method": "card",
  "description": "Order #12345",
  "metadata": {
    "order_id": "12345",
    "customer_id": "cust_abc123"
  }
}
```

**Parameters:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| amount | integer | Yes | Amount in cents |
| currency | string | Yes | ISO 4217 currency code |
| payment_method | string | Yes | Payment method type |
| description | string | No | Human-readable description |
| metadata | object | No | Key-value pairs (max 10) |

### Response

**Success (201 Created):**
```json
{
  "id": "pay_abc123",
  "status": "succeeded",
  "amount": 1000,
  "currency": "USD",
  "created_at": "2024-02-15T10:30:00Z"
}
```

**Error (400 Bad Request):**
```json
{
  "error": {
    "code": "invalid_amount",
    "message": "Amount must be at least 100 cents"
  }
}
```

### Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| invalid_amount | 400 | Amount is below minimum |
| invalid_currency | 400 | Unsupported currency |
| authentication_failed | 401 | Invalid or missing token |
| rate_limit_exceeded | 429 | Too many requests |

### Example Usage

**cURL:**
```bash
curl -X POST https://api.example.com/api/v1/payments \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer sk_live_abc123" \
  -H "Idempotency-Key: unique-request-id" \
  -d '{
    "amount": 1000,
    "currency": "USD",
    "payment_method": "card",
    "description": "Order #12345"
  }'
```

**Python:**
```python
import requests

response = requests.post(
    "https://api.example.com/api/v1/payments",
    headers={
        "Authorization": "Bearer sk_live_abc123",
        "Idempotency-Key": "unique-request-id"
    },
    json={
        "amount": 1000,
        "currency": "USD",
        "payment_method": "card",
        "description": "Order #12345"
    }
)

payment = response.json()
```
```

### Example: Runbook Quick Reference

```markdown
# API Service Runbook

## Quick Reference

**Service Status:** https://dashboard.example.com/api
**Logs:** https://logs.example.com/api
**Metrics:** https://metrics.example.com/api
**PagerDuty:** https://example.pagerduty.com/services/api

**On-Call:** @platform-oncall
**Escalation:** @platform-leads → @engineering-director

## Common Issues

### High Error Rate (5xx)

**Symptoms:**
- 5xx error rate >1% in dashboard
- PagerDuty alert: "API 5xx Error Rate High"
- User reports of timeouts

**Quick Fix:**
```bash
# Check current pod status
kubectl get pods -n production -l app=api

# Check logs for errors
kubectl logs -n production -l app=api --tail=100 | grep ERROR

# If database connection issues, restart pods
kubectl rollout restart deployment/api -n production
```

**Root Cause:** Usually database connection pool exhaustion

**Prevention:** Monitor connection pool metrics, scale database if needed

---

### Database Connection Issues

**Symptoms:**
- Logs show "Connection refused" or "Max connections"
- Increased latency on all endpoints
- 500 errors on database-heavy operations

**Diagnosis:**
```bash
# Check database connections
psql -h prod-db.example.com -U readonly -c \
  "SELECT count(*) FROM pg_stat_activity;"

# Check connection pool stats
kubectl logs -n production deployment/api | grep "pool_stats"
```

**Resolution:**
```bash
# Temporary: Increase connection pool
kubectl set env deployment/api -n production \
  DATABASE_POOL_SIZE=50

# Long-term: Scale database read replicas
# See: https://confluence.example.com/scaling-database
```

**Escalate if:** Database CPU >80% for >5 minutes
```

## Quality Checks

Before considering documentation complete, verify:

**Content Quality:**
- [ ] Clear, specific, actionable
- [ ] No ambiguous terms ("might", "usually", "sometimes")
- [ ] Examples are realistic and tested
- [ ] Troubleshooting covers common scenarios
- [ ] Security/compliance considerations noted

**Technical Accuracy:**
- [ ] Commands are correct and tested
- [ ] Version numbers specified where relevant
- [ ] Environment differences documented
- [ ] Permissions/access requirements stated

**Discoverability:**
- [ ] Descriptive page title
- [ ] Labels/tags added
- [ ] Linked from team index
- [ ] Referenced in related docs

**Maintainability:**
- [ ] Last updated date present
- [ ] Owner assigned
- [ ] Review cadence defined
- [ ] Update triggers identified

## Tips for Effective Technical Documentation

**Start with the end in mind:**
- Who will read this? What do they need to accomplish?
- What questions will they have?
- What's the fastest path to their answer?

**Be concise but complete:**
- Every sentence should add value
- Remove "filler" text
- But don't skip critical context

**Test everything:**
- Run commands in the correct environment
- Verify links work
- Check that examples are complete

**Make it scannable:**
- Use headings liberally
- Put important info in callout boxes
- Use tables for structured data
- Bold key terms

**Link generously:**
- Link to related runbooks
- Link to code repositories
- Link to dashboards
- Link to ADRs for context

**Keep it current:**
- Set reminders to review
- Update when systems change
- Archive old versions
- Mark outdated content clearly
