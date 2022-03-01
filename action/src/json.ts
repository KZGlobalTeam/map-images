import * as fs from "fs";
import * as path from "path";

import { ImageJson } from "./types";

export const generateJson = async (buildDir: string, repoUrl: string, images: string[]) => {
  const withBase = (branch: string, dir: string, name: string, ext: string) => {
    return `${repoUrl}/raw/${branch}/${dir}/${encodeURIComponent(name)}.${ext}`;
  };

  const imageJson: ImageJson[] = images.map((image) => {
    const name = path.parse(image).name;

    return {
      name: name,
      src: withBase("master", "images", name, "jpg"),
      full: withBase("public", "images", name, "jpg"),
      medium: withBase("public","mediums", name, "jpg"),
      thumb: withBase("public", "thumbnails", name, "jpg"),
      webp: withBase("public", "webp", name, "webp"),
      webp_medium: withBase("public", "webp/mediums", name, "webp"),
      webp_thumb: withBase("public", "webp/thumbs", name, "webp"),
    };
  });

  const prettyJson = JSON.stringify(imageJson, null, 2);
  const minifiedJson = JSON.stringify(imageJson, null, 0);

  const prettyJsonPath = path.join(buildDir, "maps.json");
  const minifiedJsonPath = path.join(buildDir, "maps.min.json");

  // Append is fine here, the build dir is fresh everytime
  return Promise.all([
    fs.promises.appendFile(prettyJsonPath, prettyJson),
    fs.promises.appendFile(minifiedJsonPath, minifiedJson),
  ]);
};
