import * as fs from "fs";
import * as path from "path";

export const generateMarkdown = async (buildDir: string, images: string[]) => {
  const lines = [
    "| Map | Thumbnail | Full | Medium | Thumb | WEBP Full | WEBP Medium | WEBP Thumb |",
    "|-----|-----------|------|--------|-------|-----------|-------------|------------|",
  ];

  images.forEach((image) => {
    const name = path.parse(image).name;

    const line = [
      `|${name}`,
      `|![${name}](webp/thumb/${name}.webp?raw=true)`,
      `|[image](images/${name}.jpg?raw=true)`,
      `|[medium](mediums/${name}.jpg?raw=true)`,
      `|[thumb](thumbnails/${name}.jpg?raw=true)`,
      `|[webp](webp/${name}.webp?raw=true)`,
      `|[medium](webp/medium/${name}.webp?raw=true)`,
      `|[thumb](webp/thumb/${name}.webp?raw=true)|`
    ];

    lines.push(line.join(""));
  });

  const filePath = path.join(buildDir, "README.md");
  return fs.promises.appendFile(filePath, lines.join("\n"));
};
