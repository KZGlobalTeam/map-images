import { FileStatus } from "./types";

export const validEvents = ["push", "workflow_dispatch"];
export const validExtensions = [".jpg", ".jpeg", ".webp"];

// Statuses used to trigger removal/generation
export const removalStatuses: FileStatus[] = ["removed"];
export const generateStatuses: FileStatus[] = ["added", "changed", "modified", "renamed"];
