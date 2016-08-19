
# ACPId helper for the Dell XPS 15 9530

## Setup

Place `acpi-handler.sh` under `/etc/acpi/handler.sh`, `chmod +x` it and
add `/etc/acpi/events/anything` with:

```
# Pass all events to our one handler script
event=.*
action=/etc/acpi/handler.sh %e
```
