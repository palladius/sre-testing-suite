
## 1. when everything is solved and investigated.


Create PoMo with POMO skill. Ensure TS quality since we've seen errors before.

```markdown
<!-- 01. Create PoMo -->

/sre-extension:postmortem-generator This is amazing! I'd like you now generate a PostMortem for me on this incident. Make sure the timetamps are all 
correct. Use the PostMortem skill for this.
Note the user is called user@ (that's me) and senior SRE is sre@ . 

Now that we've fixed the issue, we should find the time to find the real root-cause. Try to investigate what and when things broke. This should be before the start of our investigation.

```

## 2. Timeline reality check 

```markdown
<!-- 02. Adjust timeline (takes time)
If timeline is BAD like this:
* `14:55:00`:provided guidance on firewall rule verification
* `14:58:00`: Identified typo in Autopilot canary        
-->
Your timestamps don't convince me. Please find the exact point in logs/monitoring where things have happened. 
If a timestamp ends with :00 it's fishy.
I want real timestanos!
```
