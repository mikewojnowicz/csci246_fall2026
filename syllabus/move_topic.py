#!/usr/bin/env python3
"""
Move a schedule topic in syllabus.tex to a new position, then re-flow all
meeting dates in the affected window so no class day is left empty or doubled.

The schedule is modelled as two independent sequences:
  * SLOTS  -- the (weekday, date) pairs, which are fixed by the calendar;
  * ITEMS  -- the rows and module headers, whose ORDER we are changing.
Re-flowing = reordering ITEMS, then dealing the SLOTS back out in order.
Module headers consume no slot, so they migrate correctly on their own.

Usage:  python3 move_topic.py syllabus.tex
"""
import re
import sys

MOVE   = "Multiple Proofs"   # topic to relocate
AFTER  = "Recurrence"        # topic it should now follow

ROW = re.compile(r"^\s*([A-Za-z]+)\s*&\s*([A-Z][a-z]+\s+\d+)\s*&(.*?)&(.*?)\\\\\s*$")


def main(path):
    src = open(path, encoding="utf-8").read()
    lines = src.split("\n")

    # --- 1. Locate the window: the moved row through its destination row. ---
    start = next(i for i, l in enumerate(lines) if ROW.match(l) and MOVE  in l)
    end   = next(i for i, l in enumerate(lines) if ROW.match(l) and AFTER in l)
    if start > end:
        start, end = end, start
    window = lines[start:end + 1]

    # --- 2. Split the window into SLOTS and ITEMS. ---
    slots, items = [], []
    for line in window:
        m = ROW.match(line)
        if m:
            day, date, topic, reading = m.groups()
            slots.append((day, date))
            items.append({"kind": "row", "topic": topic, "reading": reading})
        else:
            items.append({"kind": "raw", "text": line})

    # --- 3. Reorder: pull the moved row out, reinsert it after its target. ---
    src_i = next(i for i, it in enumerate(items)
                 if it["kind"] == "row" and MOVE in it["topic"])
    moved = items.pop(src_i)
    dst_i = next(i for i, it in enumerate(items)
                 if it["kind"] == "row" and AFTER in it["topic"])
    items.insert(dst_i + 1, moved)

    # --- 4. Deal the (unchanged) slots back out in order. ---
    out, nxt = [], iter(slots)
    for it in items:
        if it["kind"] == "raw":
            out.append(it["text"])
        else:
            day, date = next(nxt)
            out.append(f"{day} & {date} &{it['topic']}&{it['reading']}\\\\")

    lines[start:end + 1] = out
    open(path, "w", encoding="utf-8").write("\n".join(lines))

    print(f"Re-flowed {len(slots)} meetings from {slots[0][1]} to {slots[-1][1]}.")
    for (day, date), it in zip(slots, [i for i in items if i["kind"] == "row"]):
        print(f"  {day:4s} {date:8s}  {it['topic'].strip()}")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "syllabus.tex")

