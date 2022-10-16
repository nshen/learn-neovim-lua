#!/usr/bin/env zx

$.verbose = false;

const logo = `
  ┌──────────────┐
  │   安装脚本   │
  └──────────────┘
`;

function green(message) {
  console.log(chalk.green(message));
}

function red(message) {
  console.error(chalk.red(message));
}

function blue(message) {
  console.log(chalk.blue(message));
}

function exit(errorMessage) {
  red(errorMessage);
  red("退出");
  process.exit(1);
}

async function yesOrQuit(questionString, func) {
  let res = "";
  while (res === "") {
    res = await question(questionString + " ([y] 继续 / [n] 退出): ");
  }
  res.toLowerCase().startsWith("y") ? func() : exit("选择 No");
}

blue(logo);
blue("开始环境检测...");

const checklist = ["git", "nvim", "rg", "wget", "curl"];

let program;
try {
  blue("");
  for (program of checklist) {
    await $`which ${program}`;
    green(`-> ${program} 已安装`);
  }
} catch (error) {
  exit(`${program} 没有找到，请安装后再尝试`);
}

// TODO: check os

const home = os.homedir();
await cd(home);
// backup nvim folder
const nvimDir = ".config/nvim";
if (await fs.pathExists(nvimDir)) {
  green(``);
  await yesOrQuit(`${nvimDir} 已存在，自动备份后继续？`, async () => {
    const filename = `${nvimDir}.${new Date().toISOString()}.bak`;
    green(``);
    green(`备份为 ${filename}`);
    await $`mv .config/nvim ${filename}`;
  });
}

//  backup old plugins
const pluginsDir = ".local/share/nvim/site";
if (await fs.pathExists(pluginsDir)) {
  green(``);
  await yesOrQuit(
    `插件目录 ${pluginsDir} 已存在，自动备份后继续？`,
    async () => {
      const filename = `${pluginsDir}.${new Date().toISOString()}.bak`;
      green(``);
      green(`备份为 ${filename}`);
      await $`mv .local/share/nvim/site ${filename}`;
    }
  );
}

$.verbose = true;
blue("");
blue("开始下载全新配置，请稍后...");

// red(await $`pwd`);
await $`git clone --branch v2 https://github.com/nshen/learn-neovim-lua ${nvimDir}`;

blue("");
green("下载成功");

blue("");
blue("开始下载插件管理packer.nvim...");

await $`git clone --depth 1 https://github.com/wbthomason/packer.nvim .local/share/nvim/site/pack/packer/start/packer.nvim`;

green("");
green("下载成功");

const notice = `
安装完成，运行以下命令开启 Neovim 并安装插件（需要科学网络环境）

nvim +PackerSync 

如遇失败可运行 :PackerSync 重新尝试`;

green(notice);
