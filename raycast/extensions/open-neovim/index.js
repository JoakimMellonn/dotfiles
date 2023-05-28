"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/index.ts
var src_exports = {};
__export(src_exports, {
  default: () => main
});
module.exports = __toCommonJS(src_exports);
var import_api = require("@raycast/api");
async function main() {
  const installedApplications = await (0, import_api.getApplications)();
  const wezterm = installedApplications.find((e) => e.name.toLowerCase().includes("wezterm"));
  if (wezterm == void 0)
    return "Wezterm not installed";
  console.log(wezterm.path);
}
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {});
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vLnJheWNhc3QtZXh0ZW5zaW9ucy9vcGVuLW5lb3ZpbS9zcmMvaW5kZXgudHMiXSwKICAic291cmNlc0NvbnRlbnQiOiBbImltcG9ydCB7IGdldEFwcGxpY2F0aW9ucyB9IGZyb20gXCJAcmF5Y2FzdC9hcGlcIjtcblxuZXhwb3J0IGRlZmF1bHQgYXN5bmMgZnVuY3Rpb24gbWFpbigpIHtcbiAgICBjb25zdCBpbnN0YWxsZWRBcHBsaWNhdGlvbnMgPSBhd2FpdCBnZXRBcHBsaWNhdGlvbnMoKTtcbiAgICBjb25zdCB3ZXp0ZXJtID0gaW5zdGFsbGVkQXBwbGljYXRpb25zLmZpbmQoKGUpID0+IGUubmFtZS50b0xvd2VyQ2FzZSgpLmluY2x1ZGVzKFwid2V6dGVybVwiKSk7XG4gICAgaWYgKHdlenRlcm0gPT0gdW5kZWZpbmVkKSByZXR1cm4gXCJXZXp0ZXJtIG5vdCBpbnN0YWxsZWRcIjtcbiAgICBjb25zb2xlLmxvZyh3ZXp0ZXJtLnBhdGgpO1xufVxuIl0sCiAgIm1hcHBpbmdzIjogIjs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUEsaUJBQWdDO0FBRWhDLGVBQU8sT0FBOEI7QUFDakMsUUFBTSx3QkFBd0IsVUFBTSw0QkFBZ0I7QUFDcEQsUUFBTSxVQUFVLHNCQUFzQixLQUFLLENBQUMsTUFBTSxFQUFFLEtBQUssWUFBWSxFQUFFLFNBQVMsU0FBUyxDQUFDO0FBQzFGLE1BQUksV0FBVztBQUFXLFdBQU87QUFDakMsVUFBUSxJQUFJLFFBQVEsSUFBSTtBQUM1QjsiLAogICJuYW1lcyI6IFtdCn0K
