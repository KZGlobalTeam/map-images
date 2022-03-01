import * as fs from "fs";
import * as path from "path";
import * as core from "@actions/core";

export const ensureDir = async (dir: string) => {
  return fs.promises.mkdir(dir, { recursive: true });
};

export const timePromise = async (label: string, promise: Promise<unknown>) => {
  console.time(label);
  await promise;
  console.timeEnd(label);
};

export const getFilesInDir = async (dir: string, validExtensions: string[]) => {
  const files = await fs.promises.readdir(dir);

  const validFiles = files.filter((file) => {
    const parsed = path.parse(file);
    return validExtensions.includes(parsed.ext);
  });

  return validFiles.map((file) => {
    return path.join(dir, file);
  });
};

export const listEntries = (groupName: string, items: string[]) => {
  core.startGroup(`${groupName} (${items.length} entries)`);

  items.forEach((item) => {
    core.info(`- "${item}"`);
  });

  return core.endGroup();
};
