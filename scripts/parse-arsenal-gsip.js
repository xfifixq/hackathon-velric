/**
 * Parse Arsenal_GSIP_Blueprint_v2.xlsx to extract structure and numeric data
 * Run: node scripts/parse-arsenal-gsip.js
 */
const XLSX = require("xlsx");
const path = require("path");
const fs = require("fs");

const filePath = path.join(__dirname, "..", "Arsenal_GSIP_Blueprint_v2.xlsx");
const workbook = XLSX.readFile(filePath);

// Sheet 02: Functional Team Map - get pillar mapping
const teamMap = XLSX.utils.sheet_to_json(workbook.Sheets["02 Functional Team Map"], { header: 1 });
console.log("\n=== 02 Functional Team Map (all rows) ===");
teamMap.forEach((row, i) => console.log(i, row));

// Sheet 03: Skills & Capabilities - Current/Target maturity
const skillsMap = XLSX.utils.sheet_to_json(workbook.Sheets["03 Skills & Capabilities Map"], { header: 1 });
console.log("\n=== 03 Skills & Capabilities Map (all rows) ===");
skillsMap.forEach((row, i) => console.log(i, row));

// Sheet 01: Executive Summary - percentages/targets
const execSum = XLSX.utils.sheet_to_json(workbook.Sheets["01 Executive Summary"], { header: 1 });
console.log("\n=== 01 Executive Summary (key rows) ===");
execSum.slice(0, 25).forEach((row, i) => console.log(i, row));
