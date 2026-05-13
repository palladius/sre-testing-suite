
## Investigation prompts
### Setup
Ensure the sre-gemini-cli-extensions are installed

```bash
gemini extensions install https://github.com/gemini-cli-extensions/sre
```
### Investigation
**Prompts for starting the investigation and generate postmortem reports**
Run these prompts from the gemini-cli

**00-setup**
- Instructions required for initial setup of mcpservers

**01-start-investigation**
- Prompts for the sre gemini-cli-extension to trigger the investigation with investigation-entrypoint

**02-generate-postmortem**
- Prompts for the sre gemini-cli-extension to trigger the investigation with investigation-entrypoint

**03-generate-graph**
- Generates incident graphs based on all the investigation data collected and embedds it into the postmortem report generated. 

- Also consists of prompts leveraging nanobanana to update architecture diagram to represent the failure scenarios