

## when poMo is done -> 📊 GRAPHS!

lets generate incident graphs

```markdown
<!-- 3. Make 📊 graphs -->

/sre-extension:monitoring-graphs Use Monitoring Graph skill to generate high-quality, annotated incident graphs to please Ben Treynor.
I want to make sure anyone who's not in Cloud can see something in GOOD state -> breaking -> and coming back again.
Use python and create bespoke graph.
No fake numbers, they all need to come from Cloud Logging or Cloud Monitoring!

```

### if graph is good but doenst show LOW-HIGH-LOW

```markdown
they are AMAZING! 1. how did u do them with ONE single CSV and single value? Where did u get the green and blue     
values? I'd expect 4 CSVs or 2CSVs with double values. 2. This is good for a first iteration, but Ideally I'd like  
the window to extend (shrink?) to when rthere were NO error since I know both errors were human injected ;)    
```

### if one graph is PERFECT (Error Logs) but the other is missing (network breakage)

Now you fixed two bugs: one is the errors exemplified by this (incident_final_graph.png), but there was also a fix where network was blackholed completely and everything was doing 500. Any chance we can see the network TRAFFIC to go from FrontEnd
to ProductCatalogService? That should be a 100 / 0 / 100 graph if you pull the right graph! 
Can u try that for me? Ensure to use gross-grained monitoring data or it will take ages!

### Generating arch diagram to reflect breakage-scenarios

One last thing, the [Online Boutique](https://github.com/GoogleCloudPlatform/microservices-demo/)
has an arch diagram showing who talks to what.

https://github.com/GoogleCloudPlatform/microservices-demo/raw/main/docs/img/architecture-diagram.png

any chance you can edit this graph with nanobanana and show me BOTH outages what were they impacting?

I'd like to see some red lines showing X -> Y broken.

My senior SRE explained to me but I didn't understand very well. Can you help?

### second one

One last thing, the [Online Boutique](https://github.com/GoogleCloudPlatform/microservices-demo/)
has an arch diagram showing who talks to what.

https://github.com/GoogleCloudPlatform/microservices-demo/raw/main/docs/img/architecture-diagram.png

any chance you can edit this graph with nanobanana and show me BOTH outages what were they impacting?

I'd like to see some red lines showing X -> Y broken.

My senior SRe explained to me but I didn't understand very well. Can you help?