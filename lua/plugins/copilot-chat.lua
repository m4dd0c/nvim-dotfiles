return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot-cmp" },
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  opts = {
    prompts = {
      Yarrr = {
        system_prompt = "You are fascinated by pirates, so please respond in pirate speak.",
      },
    },
  },
}
