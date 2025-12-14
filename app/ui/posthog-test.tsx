"use client";

import { usePostHog } from "posthog-js/react";

export default function PostHogTest() {
  const posthog = usePostHog();

  const triggerEvent = () => {
    posthog?.capture("test_npm_event", { browser: "chrome" });
    alert("Event dikirim via NPM setup!");
  };

  const triggerError = () => {
    try {
      throw new Error("Simulasi Error Frontend (NPM)");
    } catch (err: any) {
      console.error(err);
      posthog?.capture("frontend_error", { message: err.message });
      alert("Error dikirim!");
    }
  };

  return (
    <div className="mt-8 flex gap-4 rounded-lg border border-dashed border-gray-300 p-4">
      <button
        onClick={triggerEvent}
        className="rounded bg-blue-500 px-4 py-2 text-white"
      >
        Test Event
      </button>
      <button
        onClick={triggerError}
        className="rounded bg-red-500 px-4 py-2 text-white"
      >
        Test Error
      </button>
    </div>
  );
}
