export type FileStatus =
  | "removed"
  | "added"
  | "modified"
  | "renamed"
  | "copied"
  | "changed"
  | "unchanged";

export interface ImageJson {
  name: string;
  src: string;
  full: string;
  medium: string;
  thumb: string;
  webp: string;
  webp_medium: string;
  webp_thumb: string;
}

export enum ImageFormat {
  JPG = "jpg",
  WEBP = "webp"
}

export enum ImageVariant {
  Full = "full",
  Medium = "medium",
  Thumbnail = "thumbnail"
}

export type ImageDimensions = Readonly<[number, number | undefined]>;

export type DispatchInputs = null | {
  maps?: string;
}
