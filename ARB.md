# Architecture Review Board Meeting Agenda
**Date:** June 13th, 2024  
**Time:** 1:00 PM CST  
**Location:** Virtual (Link)

**Facilitator:** Robert Howerton

---

## 1. Introductions and Attendance
**Participants:** Robert Howerton, Art Harvey, Reed Cureton, Leo Maguire, George Mynatt

---

## 2. Project Status Updates
**Project A: Exchange Migration**
- Migrated: 1,924 accounts
- Remaining: 661 accounts
- Status: On track for 100% completion by the end of June.

**Project B: Arc**
- Completion: 96%
- Status: Patching established, consider project complete.
- Issues: 2012/2016 server related operational issues (not Arc-dependent).

**Project C: SSL Certificate**
- Discuss milestones and outstanding issues

---

## 3. New Architecture Proposals
**Proposal 1: Datacenter Preparation**
- **Onsite Facilities Coordination**
  - Review power and Ethernet cable management (over vs. under cage, tile placement for cooling).
  - Minimal perforated tiles from last visit; need thermal map sensors.
  - Proper EMI shielding for Ethernet cables; use D-hooks for power and Ethernet cable management.

- **Architecture and Components for Movement**
  - Targeting DC2 upon hardware arrival, anticipated end of the month.
  - Tasks include build server host, cage rails, CPU, memory, local storage, Rack Power Supply (RPS), and Gator clips.
  - Steps: Deploy ESX software, prepare and build; secure root configuration; network setup via DCUI; deploy ESX license key.
  - Security: Hardening, VMware tools update, and reboot.
  - Migration: Move VMs from Lzvcsa2.dmicorp.com (vSphere 7.0.3 to 8.